import 'package:flutter/cupertino.dart';

class Vaccination with ChangeNotifier {
  final String disease;
  final String vaccine;
  final String brandname;
  final String whatfor;
  final String sideeffects;
  final String worstcase;
  final String file;
  final List time;
  final int safe;
  Vaccination(
      {required this.disease,
      required this.vaccine,
      required this.brandname,
      required this.whatfor,
      required this.sideeffects,
      required this.worstcase,
      required this.file,
      required this.time,
    required this.safe
      });
}

List<Vaccination> vacdetails = [
  Vaccination(
      disease: 'Diphtheria,Pertussis and Tetanus',
      vaccine:
          'Diphtheria and Tetanus Toxoids and Acellular Pertussis Adsorbed (DTaP)',
      brandname: 'Daptacel and Infanrix',
      whatfor:
          'Prevents the bacterial diseases diphtheria, tetanus (lockjaw), and pertussis (whooping cough). This combination vaccine is given as a series in infants and children 6 weeks through 6 years of age, prior to their 7th birthday. The bacteria that cause diphtheria can infect the throat, causing a thick covering that can lead to problems with breathing, paralysis, or heart failure. Tetanus can cause painful tightening (spasms) of the muscles, seizures, paralysis, and death. Pertussis, also known as whooping cough, has the initial symptoms of runny nose, sneezing, and a mild cough, which may seem like a typical cold.  Usually, the cough slowly becomes more severe.  Eventually the patient may experience bouts of rapid coughing followed by the “whooping” sound that gives the disease its common name as they try to inhale. While the coughing fit is occurring, the patient may vomit or turn blue from lack of air.  Patients gradually recover over weeks to months. ',
      sideeffects:
          ' Fever, drowsiness, fussiness/irritability, and redness, soreness, or swelling at the injection site.',
      worstcase:
          'The child is moderately or severely ill, has had swelling of the brain within 7 days after a previous dose of vaccine, has a neurologic disorder such as epilepsy, or has had a severe allergic reaction to a previous shot.',
      file: 'assets/images/dpt.jpg',
      time: ['6 weeks','10 weeks','14 weeks'],
      safe: 99
      ),
  /*Vaccination(
      disease: 'Hepatitis B',
      vaccine: ' Hepatitis B Vaccine',
      brandname: ' Engerix-B and Recombivax HB',
      whatfor:
          'Prevents infection caused by hepatitis B virus. Hepatitis B is spread when body fluid infected with hepatitis B enters the body of a person who is not infected.  Hepatitis B can lead to chronic hepatitis (liver inflammation), liver cancer, and death. The vaccines are approved for individuals of all ages, including newborns. It is particularly important for those at increased risk of exposure to hepatitis B virus such as a baby born to mom who is infected with the virus.',
      sideeffects:
          'Soreness, redness, swelling at injection site, irritability, fever, diarrhea, fatigue/weakness, loss of appetite and headache.',
      worstcase:
          'The child is moderately or severely ill, or has ever had a life-threatening allergic reaction to yeast or to a previous dose of the vaccine.',
      file: 'assets/images/dpt.jpg',
      time: []
      ),*/
  Vaccination(
      disease: ' Measles, Mumps and Rubella',
      vaccine: 'Measles, Mumps and Rubella Vaccine',
      brandname: 'M-M-R II',
      whatfor:
          '  Prevents measles, mumps, and rubella in those 12 months of age and older. Measles is a respiratory disease that causes a skin rash all over the body, and fever, cough and runny nose.  Measles can be severe, causing ear infections, pneumonia, seizures, and swelling of the brain. Mumps causes fever, headache, loss of appetite and the well-known sign of swollen cheeks and jaw which is from the swelling of the salivary glands. Rare complications include deafness, meningitis (infection of the lining that surrounds the brain and spinal cord), and painful swelling of the testicles or ovaries. Rubella, also called German Measles, causes fever, a rash, and--mainly in women--can also cause arthritis.  Rubella infection during pregnancy can lead to birth defects.',
      sideeffects:
          ' Fever, mild rash, fainting, headache, dizziness, irritability and burning/stinging, redness, swelling, and tenderness at the injection site.',
      worstcase:
          'The child is ill and has a fever or has ever had an allergic reaction to gelatin, the antibiotic neomycin, or a previous dose of the vaccine, has immune system problems, or cancer, or problems with the blood or lymph system.',
      file: 'assets/images/mr.jpg',
      time: ['9 months ','12 months'],
      safe: 98
      ),
  Vaccination(
      disease: 'Poliovirus',
      vaccine: 'Inactivated Poliovirus Vaccine',
      brandname: 'Ipol',
      whatfor:
          'Prevents polio in infants as young as 6 weeks of age.  Polio is a disease that can cause paralysis or death. ',
      sideeffects:
          'Redness, hardening and pain at the injection site, fever, irritability, sleepiness, fussiness, and crying.',
      worstcase:
          'The child is moderately or severely ill, including illness with a fever, has ever had a severe allergic reaction to a previous dose of polio vaccine, any component of the vaccine, or an allergic reaction to the antibiotics neomycin, streptomycin, or polymyxin B.',
      file: 'assets/images/ipv.jpg',
      time: ['14 weeks'],
      safe: 97
      ),
  Vaccination(
      disease: 'Pneumococcal 13-valent Conjugate',
      vaccine: 'Pneumococcal 13-valent Conjugate Vaccine',
      brandname: 'Prevnar 13',
      whatfor:
          ' Prevents invasive disease caused by 13 different types of the bacterium Streptococcus pneumoniae in infants, children and adolescents ages 6 weeks through 17 years.  In infants and children 6 weeks through 5 years of age, it is also approved for the prevention of otitis media (ear infection) caused by 7 different types of the bacterium.  Streptococcus pneumonie can cause infections of the blood, middle ear, and the covering of the brain and spinal cord, as well as pneumonia.  Prevnar 13 is also approved for adults 18 years of age and older.',
      sideeffects:
          'Pain, redness and swelling at the injection site, irritability, decreased appetite and fever.',
      worstcase:
          'The child is moderately or severely ill, has ever had an allergic reaction to a previous dose or component of the vaccine, including diphtheria toxoid (for example, DTaP vaccine).',
      file: 'assets/images/pcv-vaccine.jpg',
      time: ['6 weeks ','10 weeks' , '9 months'],
      safe: 98
      ),
  Vaccination(
      disease: 'Rotavirus',
      vaccine: 'Rotavirus Vaccine',
      brandname: 'Rotarix and RotaTeq',
      whatfor:
          'Prevents gastroenteritis caused by rotavirus infection in infants as young as 6 weeks of age.  Rotavirus disease is the leading cause of severe diarrhea and dehydration in infants worldwide.  In the United States, the disease occurs more often during the winter.  Before rotavirus vaccines were available, most children in the United States were infected with rotavirus before the age of two.  In addition, rotavirus resulted in about 55,000-70,000 hospitalizations and 20-60 infant deaths in the United States each year.',
      sideeffects:
          ' Fussiness/irritability, cough/runny nose, fever, and loss of appetite.',
      worstcase:
          ' The child has illness with a fever, a weakened immune system because of a disease, has a blood disorder, any type of cancer, has gastrointestinal problems, has had stomach surgery or ever had intussusception, which is a form of blockage of the intestines, is allergic to any of the ingredients of the vaccine, or has ever had an allergic reaction to a previous dose of the vaccine, or has regular close contact with a member of a family or household who has a weak immune system.',
      file: 'assets/images/rota.jpg',
      time: ['2 months', '4 months','6 months'],
      safe: 98
      ),
  Vaccination(
      disease: 'Japanese Encephalitis',
      vaccine: 'Japanese Encephalitis Vaccine',
      brandname: 'N/A',
      whatfor:
          'Japanese encephalitis (JE) virus is the leading cause of vaccine-preventable encephalitis in Asia and the western Pacific. For most travelers to Asia, the risk for JE is very low but varies based on destination, length of travel, season, and activities.  Most people infected with JE do not have symptoms or have only mild symptoms. However, a small percentage of infected people develop inflammation of the brain (encephalitis), with symptoms including sudden onset of headache, high fever, disorientation, coma, tremors and convulsions. About 1 in 4 cases are fatal. To prevent getting sick from JE, use an EPA-registered insect repellent, wear long-sleeved shirts and long pants, and get vaccinated.',
      sideeffects:
          ' Tenderness, redness, swelling and rashes and urticaria. Hypersensitivity or hypersensitivity-like reactions have included hives (0.2%), facial swelling (0.1%), generalized urticaria, angioedema of the extremities, and face, especially the lips and oropharynx, erythema multiforme, erythema nodosum, joint swelling, respiratory distress, hypotension, and collapse.',
      worstcase:
          'Other systemic side effects have included fever, dizziness, flu-like symptoms, headache, myalgia, malaise, and chills in 5% to 10% of vaccinees. Headache and febrile episodes were reported in 15.2% and 5.5%, respectively.',
      file: 'assets/images/je.jpeg',
      time: ['12 months'],
      safe: 97
      ),
  Vaccination(
      disease: 'Oral poliovirus',
      vaccine: "Oral poliovirus vaccine",
      brandname: 'N/A',
      whatfor:
          'Oral poliovirus vaccines (OPV) are the predominant vaccine used in the fight to eradicate polio.  There are different types of oral poliovirus vaccine, which may contain one, a combination of two, or all three different serotypes of attenuated vaccine. Each has their own advantages and disadvantages over the others. The attenuated poliovirus(es) contained in OPV are able to replicate effectively in the intestine, but around 10,000 times less able to enter the central nervous system than the wild virus. This enables individuals to mount an immune response against the virus. Virtually all countries which have eradicated polio used OPV to interrupt person to person transmission of the virus.',
      sideeffects:
          'at a rate of approximately 2 to 4 events per 1 million births,the live attenuated vaccine-virus in OPV can cause paralysis. In some cases, it is believed that this may be triggered by an immunodeficiency.',
      worstcase:
          'Very rarely, when there is insufficient coverage in a community the vaccine-virus may be able to circulate, mutate and, over the course of 12 to 18 months, reacquire neurovirulence. This is known as a circulating vaccine-derived poliovirus.',
      file: 'assets/images/oralpolio.jpg',
      time: ['6 weeks','10 weeks', '14 weeks'],
      safe: 99
      )
];
