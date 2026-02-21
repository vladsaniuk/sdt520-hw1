# LLM Usage Log

## Vlad Saniuk

Tool(s) used: Claude (web) / Sonnet 4.6    
What it was used for: validate ideas, ask questions so I could derive to solution, challenge implementation, review mistakes, write scripts     
What was not delegated: table attributes ideation, tables choice, defining PKs/FKs, logic flows, diagrams creation, validation of scripts and overall result   

### Evidence

#### Prompt 1

You are a an expert in Databases

Help me practice with designing a mini relational database for Blood Donation Coordination System

The task is to 
1) Create ER diagram that includes: entities, attributes, and relationships
2) With Primary Keys (PK) and Foreign Keys (FK) clearly identified
3) Cardinalities and optionality (e.g., 1..N, 0..1) documented on the ER diagram or in a legend.
4) Normalization: your core tables should be at least in 3NF (briefly justify any intentional denormalization).

As I'm learning do not produce final deliverables, unless explicitly asked, instead ask me questions to improve or correct my work, where they are incorrect 

I'm working step by step, so only work with the step explicitly state 

First step: Create ER diagram that includes: entities, attributes, and relationships 

I need to come up with the tables design, first I want to brain storm the attributes (table columns)

Attributes:
donor first name 
donor last name 
donor last health check date 
donor blood type 
donor blood amount taken last time 
donor total donations 
donor last donation 
donor total amount of blood donated 
clinic name (where donation takes place) 
clinic address 
doctor first name (performing blood donation) 
doctor last name 
doctor home clinic (if doctor has to go to another clinic, where donation take place) 
blood recipient clinic name 
blood recipient clinic address 
blood recipient clinic last blood delivery date 
blood recipient clinic last blood delivery amount 
blood recipient clinic total blood delivered 

This is a mini DB for practice, so the goal is to capture only significant, meaningful information, not everything available 

Now ask me questions so I could figure out any more important attributes I may have missed

##### Output 1

Great start! You've got a solid foundation. Let me ask you some questions to help you think through what might be missing.
About the Donor:
You have blood type and donation history — but what if a donor becomes ineligible to donate for a period? How would your system know whether a donor is currently available to donate or not?
About the Donation Event itself:
Right now your attributes seem split between the donor and the clinic. But is there a clear "record" of a single donation event? For example, if a donor donates three times over two years, where does each individual donation live in your design?
About the Doctor:
You have the doctor's name and home clinic. But what connects a specific doctor to a specific donation? Is there anything missing that would let you answer the question: "Who performed this particular donation?"
About Blood Inventory:
You track delivery information for recipient clinics — but do you track what happens to the blood between collection and delivery? For instance, does blood have an expiry or a status (collected, tested, available, delivered)?
About the Recipient Clinic:
You know when and how much blood was last delivered. But can you tell what blood type was delivered, or how much of each type a recipient clinic currently needs?
Pick whichever question resonates most and think it through — no need to answer all of them at once. What do you think?

#### Prompt 2 

as a next step I have created ERD using Lucid 

verify the result, pinpoint only critical mistakes, if any (screenshot attached)

##### Output 2 

Good work overall — the structure is clear and most relationships make sense. There is one critical mistake worth fixing before moving on.
Doctor's Home Clinic has no relationship to the Clinic table.
You stored HomeClinicZIP, HomeClinicCity, and HomeClinicAddressLine directly on the Doctor entity. But your Clinic table already holds all of that information. This means you're duplicating clinic data in two places, and there's no actual link between a Doctor and their home Clinic in the diagram.
Ask yourself: if a clinic's address changes, how many places would you need to update it?
The fix is straightforward — what do you think you should store in the Doctor entity instead of those three address fields, and what would that imply for the diagram?

#### Prompt 3 

Clinic and DoctorHomeClinic are 2 different entities, Clinic - where the donation takes place, DoctorHomeClinic are the clinic where doctor permanently work 

I have related attributes to the DoctorHomeClinic 

Validate the relationships:
Doctor can only belong to 1 DoctorHomeClinic
DoctorHomeClinic can have many Doctors 
Donation can happen only in 1 Clinic
Clinic can host many Donations
Donation can host only 1 Doctor and Donor
Donor can visit many Donations 
Doctor can work in many Donations
Delivery can only happen for 1 Donation
Donation result in only 1 Delivery
Delivery can happen only to 1 BloodRecipientClinic
BloodRecipientClinic can receive many Deliveries

##### Output 3 

Good progress — the entities and overall structure are solid. I can see two critical relationship mistakes worth fixing.
1. Donor ↔ Donation
You stated a Donor can visit many Donations, but the diagram shows 0..1 on the Donor side. That means a donor can only ever have 0 or 1 donations. What should that cardinality be instead?
2. Doctor ↔ DoctorHomeClinic
You stated a Doctor belongs to exactly 1 DoctorHomeClinic, and a DoctorHomeClinic can have many Doctors. But the diagram shows 1..N on the Doctor side and 0..1 on the DoctorHomeClinic side — which reads as the opposite: a doctor belongs to many clinics, and a clinic has at most 1 doctor. Which side should carry the 1..N and which should carry the 1..1?

The rest of the relationships — Delivery/Donation (1:1), Clinic/Donation, Doctor/Donation, BloodRecipientClinic/Delivery — are correctly represented.
Fix those two and you're ready to move on. What do you think the corrections should look like?

#### Prompt 4 

Added PKs and FKs, validate if I've missed or messed up anything. Do not provide correct answer, ask me questions so I could figure out and fix mistakes myself

##### Output 4 

Good work — most of it is correct! There is one mistake to find. Let me guide you to it with a question.
Look at the Delivery table. You have Donation (FK) correctly marked. But Delivery also has a relationship to another entity in your diagram — can you spot which field in Delivery should also be marked as a FK, but isn't?

#### Prompt 5 

make sense, validate updated diagram (screenshot attached)

##### Output 5 

Good progress — the derived attributes are all cleaned up. Now let me challenge you on one more normalization point.
Look at the address fields in Clinic, BloodRecipientClinic, and DoctorHomeClinic — each has ZIP, City, and AddressLine stored together.
Think about this: if you know a ZIP code, does that already determine the City? And if so, what does that mean for the relationship between ZIP and City within those tables — is City truly depending on the table's Primary Key, or is it depending on something else?

#### Prompt 6 

I'm using PostgreSQL, provide a DDL to implement the ERD, code should be minimalistic

##### Output 6 

schema.sql

A few notes on the decisions made:

UNIQUE on delivery.donation_id enforces the 1:1 relationship between Donation and Delivery
amount_ml replaces the vague AmountOfBloodDonated with an explicit unit
demand in BloodRecipientClinic is kept as a stored value since it represents a declared need, not something derivable from other tables
All FK columns on the "many" side are left nullable where the ERD showed 0..1 optionality
