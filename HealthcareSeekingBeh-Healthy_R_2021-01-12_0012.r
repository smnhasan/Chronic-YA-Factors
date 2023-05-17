#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('HealthcareSeekingBeh-Healthy_DATA_2021-01-12_0012.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$consent)="এই গবেষণায় আপনি অংশ নিতে সম্মত?"
label(data$sex)="ক) লিঙ্গ?"
label(data$age)="খ) আপনার বয়স?"
label(data$education)="গ) সর্বোচ্চ শিক্ষাগত যোগ্যতা "
label(data$employment)="ঘ) পেশা"
label(data$zila)="ঙ) আপনার বর্তমান অবস্থান (জেলা)"
label(data$location)="চ) লোকেশন এর ধরণ?"
label(data$smoking)="ছ) আপনি কি ধূমপান করেন?"
label(data$income)="জ) আপনার/পরিবারের মাসিক আয় কত?"
label(data$comorbid___2)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=ডায়াবেটিস)"
label(data$comorbid___13)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=স্থুলতা/ওবেসিটি)"
label(data$comorbid___3)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=উচ্চ-রক্তচাপ)"
label(data$comorbid___4)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=নিম্ন-রক্তচাপ)"
label(data$comorbid___10)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=থ্যালাসেমিয়া)"
label(data$comorbid___11)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=লিভারের দীর্ঘমেয়াদী রোগ)"
label(data$comorbid___12)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=অ্যাজমা)"
label(data$comorbid___5)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=কিডনি-জনিত সমস্যা)"
label(data$comorbid___6)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=হৃদ রোগ)"
label(data$comorbid___7)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=সিওপিডি (COPD))"
label(data$comorbid___9)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=অন্যান্য)"
label(data$comorbid___14)="ঝ) আপনার কোন কোন অসুস্থতা/কমর্বিডিটি আছে? [একাধিক উত্তর হতে পারে] (choice=একটিও নেই)"
label(data$blood_gr)="ঞ) আপনার রক্তের গ্রুপ?"
label(data$month_cov_pos)="১। আপনি কখন করোনা পজিটিভি হন?"
label(data$month_cov_pos_2)="১। আপনি কখন করোনা টেস্ট করেছেন?"
label(data$days_to_test)="২। উপসর্গ/সিম্পটম প্রকাশের কতদিন পরে টেস্ট করেছিলেন? "
label(data$days_to_get_result)="৩। স্যাম্পল দেয়ার পর  রেজাল্ট পেতে কতদিন লেগেছিল?"
label(data$confusion_test)="৪। টেস্ট করাবেন কিনা তা নিয়ে  কি গরিমসি/অনীহা অথবা দ্বিধা-দ্বন্দে ছিলেন? "
label(data$long_process)="৪.১। টেস্ট করার প্রক্রিয়া অনেক দীর্ঘ"
label(data$few_booths)="৪.২। কম সংখ্যক কালেকশন বুথ/ ব্যবস্থা অপ্রতুল/সুযোগ কম"
label(data$social_fear)="৪.৩। সামাজিকভাবে হেয় প্রতিপন্ন অথবা অবজ্ঞার শিকার হওয়ার আশংকা থেকে"
label(data$fear_quarantine)="৪.৪। টেস্ট পজিটিভ হলে কোয়ারেন্টাইন থাকতে  হবে এই ভয়ে"
label(data$i_will_not_get_virus)="৪.৫। করোনায় আক্রান্ত হলে আমার কিছু হবে না বলে মনে করেছিলাম"
label(data$covid_symptom___1)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=জ্বর)"
label(data$covid_symptom___2)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=কাশি)"
label(data$covid_symptom___3)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=শ্বাসকষ্ট)"
label(data$covid_symptom___4)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=গলা ব্যাথা)"
label(data$covid_symptom___5)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=সর্দি)"
label(data$covid_symptom___6)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=পেশী/শরীর ব্যাথা)"
label(data$covid_symptom___7)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=মাথা ব্যাথা)"
label(data$covid_symptom___8)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=অবসাদ/ ক্লান্তি)"
label(data$covid_symptom___9)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=ডায়রিয়া)"
label(data$covid_symptom___10)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=ক্ষুধামান্দ্য)"
label(data$covid_symptom___11)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=স্বাদ এবং/বা গন্ধ হীনতা)"
label(data$covid_symptom___12)="৫। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?  [একাধিক অপশন এ টিক দেয়া যাবে] (choice=অন্যান্য)"
label(data$action_to_mitigate___1)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=বাসায় থেকেছি কিন্তু সেলফ কোয়ারেন্টিন মানা হয়নি)"
label(data$action_to_mitigate___2)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=বাসায়   কোয়ারেন্টিন-এ ছিলাম)"
label(data$action_to_mitigate___3)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=পরিবারের সদস্যদের থেকে শারিরীক দুরত্ব বজায় রেখেছি)"
label(data$action_to_mitigate___4)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=হাসপাতলে গিয়ে ডাক্তার দেখিয়েছি)"
label(data$action_to_mitigate___5)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=প্রাইভেট চেম্বারে চিকিৎসা নিয়েছি)"
label(data$action_to_mitigate___6)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=ফোনের মাধ্যমে স্থানীয়/পরিচিত/ব্যাক্তিগত/পারিবারিক ডাক্তারের সাথে পরামর্শ করে চিকিৎসা নিয়েছি)"
label(data$action_to_mitigate___7)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=আইইডিসিআরর/সরকারী কল সেন্টারে ফোন  করে তাদের পরামর্শে চিকিৎসা নিয়েছি)"
label(data$action_to_mitigate___8)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=ফার্মেসিতে গিয়ে পরামর্শ নিয়েছি)"
label(data$action_to_mitigate___9)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=নিজের অভিজ্ঞতা অনুযায়ী ওষুধ সেবন করেছি)"
label(data$action_to_mitigate___10)="৬। উপসর্গ/লক্ষণ প্রকাশ পাওয়ার পর থেকে করোনা টেস্ট পজিটিভ হওয়ার আগ পর্যন্ত কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে]   (choice=কোনো চিকিৎসা গ্রহন করিনি)"
label(data$action_to_mitigate_2___1)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=বাসায় থেকেছি কিন্তু সেলফ কোয়ারেন্টিন মানা হয়নি)"
label(data$action_to_mitigate_2___2)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=বাসায়   কোয়ারেন্টিন-এ ছিলাম)"
label(data$action_to_mitigate_2___3)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=পরিবারের সদস্যদের থেকে শারিরীক দুরত্ব বজায় রেখেছি)"
label(data$action_to_mitigate_2___4)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=হাসপাতলে গিয়ে ডাক্তার দেখিয়েছি)"
label(data$action_to_mitigate_2___5)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=প্রাইভেট চেম্বারে চিকিৎসা নিয়েছি)"
label(data$action_to_mitigate_2___6)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=ফোনের মাধ্যমে স্থানীয়/পরিচিত/ব্যাক্তিগত/পারিবারিক ডাক্তারের সাথে পরামর্শ করে চিকিৎসা নিয়েছি)"
label(data$action_to_mitigate_2___7)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=আইইডিসিআরর/সরকারী কল সেন্টারে ফোন  করে তাদের পরামর্শে চিকিৎসা নিয়েছি)"
label(data$action_to_mitigate_2___8)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=ফার্মেসিতে গিয়ে পরামর্শ নিয়েছি)"
label(data$action_to_mitigate_2___9)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=নিজের অভিজ্ঞতা অনুযায়ী ওষুধ সেবন করেছি)"
label(data$action_to_mitigate_2___10)="৬। উপসর্গ/লক্ষণ প্রশমনে কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=কোনো চিকিৎসা গ্রহন করিনি)"
label(data$hospitalized)="৭। হাসপাতালে ভর্তি হয়েছিলেন? "
label(data$icu)="৭.১। আপনার কি আইসিইউ দরকার হয়েছিল?"
label(data$treatment_of_positive___1)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=বাসায় অবস্থান করে চিকিৎসা নিয়েছি)"
label(data$treatment_of_positive___2)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=চেম্বারে এ ডাক্তার দেখিয়েছি)"
label(data$treatment_of_positive___3)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=ফোনের মাধ্যমে স্থানীয়/পরিচিত/ব্যাক্তিগত/পারিবারিক ডাক্তারের সাথে পরামর্শ করে চিকিৎসা নিয়েছি)"
label(data$treatment_of_positive___4)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=আইইডিসিআরর/সরকারী সেন্টারে ফোন করে তাদের পরামর্শে চিকিৎসা নিয়েছি)"
label(data$treatment_of_positive___5)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=নিকটস্থ ফার্মেসিতে গিয়ে পরামর্শ নিয়েছি)"
label(data$treatment_of_positive___6)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=নিজের অভিজ্ঞতা অনুযায়ী ওষুধ সেবন করেছি)"
label(data$treatment_of_positive___7)="৭.২। হাসপাতালে ভর্তি না হয়ে কিভাবে চিকিৎসা নিয়েছেন?   [একাধিক উত্তর হতে পারে] (choice=কোনো চিকিৎসা গ্রহন করিনি)"
label(data$alterbative_treatment)="৮। আপনি কি ট্র্যাডিশন বা বিকল্প  চিকিৎসা (হোমিওপ্যাথি/হার্বাল/কবিরাজী/ অন্যান্য) নিয়েছিলেন?  "
label(data$alterbative_treatment_2)="৭। আপনি কি ট্র্যাডিশন বা বিকল্প  চিকিৎসা (হোমিওপ্যাথি/হার্বাল/কবিরাজী/ অন্যান্য) নিয়েছিলেন?  "
label(data$social_dist)="৯.১। সর্বোপরি লকডাউন এ সামাজিক দূরত্ব কতটুকু  মেনেছেন?"
label(data$stay_home)="৯.২। অতি প্রয়োজন ছাড়া বাসায় অবস্থান করা কতটুকু  মেনেছেন?"
label(data$family_affected)="১০। পরিবারের কারো মধ্যে একই ধরণের লক্ষণ দেখা দিয়েছিল?"
label(data$social_dist2)="৮.১। সর্বোপরি লকডাউন এ সামাজিক দূরত্ব কতটুকু মেনেছেন?"
label(data$stayhome2)="৮.২। অতি প্রয়োজন ছাড়া বাসায় অবস্থান করা কতটুকু মেনেছেন?"
label(data$family_affected_2)="৯। পরিবারের কারো মধ্যে একই ধরণের লক্ষণ দেখা দিয়েছিল?"
label(data$symptoms_gr_2___1)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=জ্বর)"
label(data$symptoms_gr_2___2)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=কাশি)"
label(data$symptoms_gr_2___3)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=শ্বাসকষ্ট)"
label(data$symptoms_gr_2___4)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=গলা ব্যাথা)"
label(data$symptoms_gr_2___5)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=সর্দি)"
label(data$symptoms_gr_2___6)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=পেশী/শরীর ব্যাথা)"
label(data$symptoms_gr_2___7)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=মাথা ব্যাথা)"
label(data$symptoms_gr_2___8)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=অবসাদ/ ক্লান্তি)"
label(data$symptoms_gr_2___9)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=ডায়রিয়া)"
label(data$symptoms_gr_2___10)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=ক্ষুধামান্দ্য)"
label(data$symptoms_gr_2___11)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=স্বাদ এবং/বা গন্ধ হীনতা)"
label(data$symptoms_gr_2___12)="১। আপনার কোন কোন লক্ষণ দেখা দিয়েছিল?   [একাধিক উত্তর হতে পারে] (choice=অন্যান্য)"
label(data$source_info___1)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=ফেসবুক পোস্ট)"
label(data$source_info___2)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=টিভি)"
label(data$source_info___7)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=ডাক্তার/ স্বাস্থ্যকর্মী/ হাঁসপাতাল/স্বাস্থ কেন্দ্র)"
label(data$source_info___3)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=পত্রিকা (প্রিন্ট ও অনলাইন))"
label(data$source_info___4)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=আত্মীয় বা বন্ধু যারা ফেসসবুকে নেই)"
label(data$source_info___5)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=লিফলেট /ব্যানার/ফেস্টুন)"
label(data$source_info___6)="২। এই লক্ষণগুলো যে করোনাভাইরাসের তা কিভাবে জেনেছেন?  [একাধিক উত্তর হতে পারে] (choice=ইমেইল/অন্য সোশ্যাল মিডিয়া/ইন্টারনেট সার্চ)"
label(data$onset_of_symptom)="৩। আপনার করোনার লক্ষণ কোন মাসে দেখা দিয়েছিল?   "
label(data$reason_not_test___1)="৪। করোনার লক্ষণ দেখা দেয়ার পরও কেন টেস্ট করাননি?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট করার প্রক্রিয়া অনেক দীর্ঘ)"
label(data$reason_not_test___2)="৪। করোনার লক্ষণ দেখা দেয়ার পরও কেন টেস্ট করাননি?  [একাধিক উত্তর হতে পারে] (choice=কম সংখ্যক কালেকশন বুথ/ব্যবস্থা অপ্রতুল/সুযোগ কম)"
label(data$reason_not_test___3)="৪। করোনার লক্ষণ দেখা দেয়ার পরও কেন টেস্ট করাননি?  [একাধিক উত্তর হতে পারে] (choice=সামাজিকভাবে হেয় প্রতিপন্ন অথবা অবজ্ঞার শিকার হওয়ার আশংকা থেকে)"
label(data$reason_not_test___4)="৪। করোনার লক্ষণ দেখা দেয়ার পরও কেন টেস্ট করাননি?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট পজিটিভ হলে কোয়ারেন্টাইন থাকতে হবে এই ভয়ে)"
label(data$reason_not_test___6)="৪। করোনার লক্ষণ দেখা দেয়ার পরও কেন টেস্ট করাননি?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট করাতে গেলে সংক্রমণের ঝুঁকি/সম্ভাবনা ছিল)"
label(data$reason_not_test___5)="৪। করোনার লক্ষণ দেখা দেয়ার পরও কেন টেস্ট করাননি?  [একাধিক উত্তর হতে পারে] (choice=করোনায় আক্রান্ত হলে আমার কিছু হবে না বলে মনে করেছিলাম)"
label(data$symptom_mitigation___1)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=বাসায় অবস্থান করে চিকিৎসা নিয়েছি)"
label(data$symptom_mitigation___2)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=হাসপাতালে চিকিৎসা নিয়েছি)"
label(data$symptom_mitigation___3)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=চেম্বারে এ ডাক্তার দেখিয়েছি)"
label(data$symptom_mitigation___4)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=ফোনের মাধ্যমে স্থানীয়/পরিচিত/ব্যাক্তিগত/পারিবারিক ডাক্তারের সাথে পরামর্শ করে চিকিৎসা নিয়েছি)"
label(data$symptom_mitigation___5)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=আইইডিসিআরর/সরকারী সেন্টারে ফোন করে তাদের পরামর্শে চিকিৎসা নিয়েছি)"
label(data$symptom_mitigation___6)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=নিকটস্থ ফার্মেসিতে গিয়ে পরামর্শ নিয়েছি)"
label(data$symptom_mitigation___7)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=নিজের অভিজ্ঞতা অনুযায়ী ওষুধ সেবন করেছি)"
label(data$symptom_mitigation___8)="৫। করোনার উপসর্গ/লক্ষণ দেখা দেয়ার পর  কী কী ব্যবস্থা নিয়েছিলেন?  [একাধিক উত্তর হতে পারে] (choice=কোনো চিকিৎসা গ্রহন করিনি)"
label(data$alternative_trt)="৬। আপনি কি   ট্র্যাডিশন বা বিকল্প চিকিৎসা (হোমিওপ্যাথি/হার্বাল/কবিরাজী/ অন্যান্য ) নিয়েছিলেন?  "
label(data$soc_dist)="৭.১। সর্বোপরি লকডাউন এ সামাজিক দূরত্ব কতটুকু মেনেছেন?"
label(data$stay_home_2)="৭.২। অতি প্রয়োজন ছাড়া বাসায় অবস্থান করা কতটুকু মেনেছেন?"
label(data$fam_affected_2)="৮। পরিবারের কারো মধ্যে একই ধরণের লক্ষণ দেখা দিয়েছিল? "
label(data$risk_corona)="১। আপনি COVID-19 এ আক্রান্ত হবার ক্ষেত্রে নিজেকে কতটুকু ঝুঁকিপূর্ণ মনে করেন?"
label(data$days_work_outside)="২। আপনাকে জীবিকার প্রয়োজনে সপ্তাহে কয়দিন বাইরে যেতে হয়?"
label(data$soap_3)="৩.১। আপনি নিয়মিত সাবান দিয়ে হাত ধৌত/সেনিজাইটার ব্যবহার করেন?"
label(data$mask_3)="৩.২। আপনি বাইরে গেলে নিয়মিত মাস্ক পরিধান করেন?"
label(data$soc_dist_3)="৩.৩। আপনি সামাজিক দূরত্ব মেনে চলেন?"
label(data$stay_home_3)="৩.৪। আপনি অতি প্রয়োজন ছাড়া বাসায়ই অবস্থান করেন?"
label(data$prevent_measures)="৪। কোভিড-১৯ প্রতিরোধের জন্য আপনি কি ঔষধ/পথ্য/বিকল্প (ব্যায়াম বা বিকল্প চিকিৎসা যেমন হোমিও) ব্যবস্থা গ্রহন করছেন? "
label(data$prevent_measures_2___1)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=হাইড্রক্সিক্লোরোকুইন (Hydroxychloroquine))"
label(data$prevent_measures_2___2)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=কৃমির ঔষধ  ইভারমেকটিন (Ivermectin))"
label(data$prevent_measures_2___12)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=কর্টিকোস্টেরয়েডাল ড্রাগ (Dexamethasone))"
label(data$prevent_measures_2___3)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=হোমিওপ্যাথি)"
label(data$prevent_measures_2___4)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=হার্বাল)"
label(data$prevent_measures_2___5)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=কালোজিরা)"
label(data$prevent_measures_2___6)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=মধু)"
label(data$prevent_measures_2___7)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=ভেষজ গ্রহন (আদা/রসুন))"
label(data$prevent_measures_2___8)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=প্রতিদিন কিছু সময় ব্যায়াম করি)"
label(data$prevent_measures_2___9)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=ভিটামিন সি সমৃদ্ধ ফল (যেমন লেবু, কমলা, পেয়ারা))"
label(data$prevent_measures_2___10)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=ভিটামিন ডি পেতে নিয়মিত রোদে কিছু সময় কাটাচ্ছি)"
label(data$prevent_measures_2___11)="৪.১। কি কি ঔষধ/বিকল্প কিছু গ্রহন করছেন?   [একাধিক উত্তর হতে পারে] (choice=অন্যান্য)"
label(data$hyp_if_sympt_onset___1)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=বাসায় অবস্থান (কোয়ারিন্টিন) করতে থাকব)"
label(data$hyp_if_sympt_onset___2)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=পরিবারের সদস্যদের থেকে শারিরীক দুরত্ব বজায় রাখবো)"
label(data$hyp_if_sympt_onset___3)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=সাথে সাথে ডাক্তার/ হাসপাতাল এ যোগাযোগ করে সিদ্ধান্ত নিবো)"
label(data$hyp_if_sympt_onset___4)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=সরকারী কল সেন্টার এ যোগাযোগ করে প্রয়োজনীয় ব্যবস্থা নিবো)"
label(data$hyp_if_sympt_onset___5)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=ফোনের মাধ্যমে স্থানীয়/পরিচিত/ব্যাক্তিগত/পারিবারিক ডাক্তারের সাথে পরামর্শ করে চিকিৎসা নিবো)"
label(data$hyp_if_sympt_onset___6)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=অপেক্ষা করতে থাকবো দেখি কি হয়?)"
label(data$hyp_if_sympt_onset___7)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট করতে উদ্যোগ নিবো)"
label(data$hyp_if_sympt_onset___8)="৫। ধরুন, বাংলাদেশের বর্তমান করোনা পরিস্থিতিতে আপনার করোনার  লক্ষণ প্রকাশ পেল। এমতাবস্থায় আপনি কি করবেন?  [একাধিক উত্তর হতে পারে] (choice=সেভাবে চিন্তা করেনি/নিশ্চিত নই)"
label(data$interest_on_test)="৬।  করোনার মত লক্ষণ প্রকাশ পেলে টেস্ট করার ব্যাপারে আপনি কতটুকু আগ্রহী?"
label(data$why_not_tested_3___1)="৬.১। তেমন আগ্রহি না হবার কারন কী কী হতে পারে ?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট করার প্রক্রিয়া অনেক দীর্ঘ)"
label(data$why_not_tested_3___2)="৬.১। তেমন আগ্রহি না হবার কারন কী কী হতে পারে ?  [একাধিক উত্তর হতে পারে] (choice=কম সংখ্যক কালেকশন বুথ/ব্যবস্থা অপ্রতুল/সুযোগ কম)"
label(data$why_not_tested_3___3)="৬.১। তেমন আগ্রহি না হবার কারন কী কী হতে পারে ?  [একাধিক উত্তর হতে পারে] (choice=সামাজিকভাবে হেয় প্রতিপন্ন অথবা অবজ্ঞার শিকার হতে পারি)"
label(data$why_not_tested_3___4)="৬.১। তেমন আগ্রহি না হবার কারন কী কী হতে পারে ?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট পজিটিভ হলে কোয়ারেন্টাইন থাকতে হবে এই ভয়)"
label(data$why_not_tested_3___6)="৬.১। তেমন আগ্রহি না হবার কারন কী কী হতে পারে ?  [একাধিক উত্তর হতে পারে] (choice=টেস্ট করাতে গেলে সংক্রমণের ঝুঁকি/সম্ভাবনা আছে)"
label(data$why_not_tested_3___5)="৬.১। তেমন আগ্রহি না হবার কারন কী কী হতে পারে ?  [একাধিক উত্তর হতে পারে] (choice=করোনায় আক্রান্ত হলে আমার কিছু হবে না)"
label(data$starting_point_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$consent.factor = factor(data$consent,levels=c("1","2"))
data$sex.factor = factor(data$sex,levels=c("1","2","3"))
data$education.factor = factor(data$education,levels=c("1","2","3","4","5","6","7"))
data$employment.factor = factor(data$employment,levels=c("1","8","9","2","3","4","5","7"))
data$zila.factor = factor(data$zila,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64"))
data$location.factor = factor(data$location,levels=c("1","2","3","4"))
data$smoking.factor = factor(data$smoking,levels=c("1","2"))
data$income.factor = factor(data$income,levels=c("1","6","2","3","4","5"))
data$comorbid___2.factor = factor(data$comorbid___2,levels=c("0","1"))
data$comorbid___13.factor = factor(data$comorbid___13,levels=c("0","1"))
data$comorbid___3.factor = factor(data$comorbid___3,levels=c("0","1"))
data$comorbid___4.factor = factor(data$comorbid___4,levels=c("0","1"))
data$comorbid___10.factor = factor(data$comorbid___10,levels=c("0","1"))
data$comorbid___11.factor = factor(data$comorbid___11,levels=c("0","1"))
data$comorbid___12.factor = factor(data$comorbid___12,levels=c("0","1"))
data$comorbid___5.factor = factor(data$comorbid___5,levels=c("0","1"))
data$comorbid___6.factor = factor(data$comorbid___6,levels=c("0","1"))
data$comorbid___7.factor = factor(data$comorbid___7,levels=c("0","1"))
data$comorbid___9.factor = factor(data$comorbid___9,levels=c("0","1"))
data$comorbid___14.factor = factor(data$comorbid___14,levels=c("0","1"))
data$blood_gr.factor = factor(data$blood_gr,levels=c("1","2","3","4","5","6","7","8","9"))
data$month_cov_pos.factor = factor(data$month_cov_pos,levels=c("1","2","3","4"))
data$month_cov_pos_2.factor = factor(data$month_cov_pos_2,levels=c("1","2","3","4"))
data$confusion_test.factor = factor(data$confusion_test,levels=c("1","2"))
data$long_process.factor = factor(data$long_process,levels=c("1","2","3","4","5"))
data$few_booths.factor = factor(data$few_booths,levels=c("1","2","3","4","5"))
data$social_fear.factor = factor(data$social_fear,levels=c("1","2","3","4","5"))
data$fear_quarantine.factor = factor(data$fear_quarantine,levels=c("1","2","3","4","5"))
data$i_will_not_get_virus.factor = factor(data$i_will_not_get_virus,levels=c("1","2","3","4","5"))
data$covid_symptom___1.factor = factor(data$covid_symptom___1,levels=c("0","1"))
data$covid_symptom___2.factor = factor(data$covid_symptom___2,levels=c("0","1"))
data$covid_symptom___3.factor = factor(data$covid_symptom___3,levels=c("0","1"))
data$covid_symptom___4.factor = factor(data$covid_symptom___4,levels=c("0","1"))
data$covid_symptom___5.factor = factor(data$covid_symptom___5,levels=c("0","1"))
data$covid_symptom___6.factor = factor(data$covid_symptom___6,levels=c("0","1"))
data$covid_symptom___7.factor = factor(data$covid_symptom___7,levels=c("0","1"))
data$covid_symptom___8.factor = factor(data$covid_symptom___8,levels=c("0","1"))
data$covid_symptom___9.factor = factor(data$covid_symptom___9,levels=c("0","1"))
data$covid_symptom___10.factor = factor(data$covid_symptom___10,levels=c("0","1"))
data$covid_symptom___11.factor = factor(data$covid_symptom___11,levels=c("0","1"))
data$covid_symptom___12.factor = factor(data$covid_symptom___12,levels=c("0","1"))
data$action_to_mitigate___1.factor = factor(data$action_to_mitigate___1,levels=c("0","1"))
data$action_to_mitigate___2.factor = factor(data$action_to_mitigate___2,levels=c("0","1"))
data$action_to_mitigate___3.factor = factor(data$action_to_mitigate___3,levels=c("0","1"))
data$action_to_mitigate___4.factor = factor(data$action_to_mitigate___4,levels=c("0","1"))
data$action_to_mitigate___5.factor = factor(data$action_to_mitigate___5,levels=c("0","1"))
data$action_to_mitigate___6.factor = factor(data$action_to_mitigate___6,levels=c("0","1"))
data$action_to_mitigate___7.factor = factor(data$action_to_mitigate___7,levels=c("0","1"))
data$action_to_mitigate___8.factor = factor(data$action_to_mitigate___8,levels=c("0","1"))
data$action_to_mitigate___9.factor = factor(data$action_to_mitigate___9,levels=c("0","1"))
data$action_to_mitigate___10.factor = factor(data$action_to_mitigate___10,levels=c("0","1"))
data$action_to_mitigate_2___1.factor = factor(data$action_to_mitigate_2___1,levels=c("0","1"))
data$action_to_mitigate_2___2.factor = factor(data$action_to_mitigate_2___2,levels=c("0","1"))
data$action_to_mitigate_2___3.factor = factor(data$action_to_mitigate_2___3,levels=c("0","1"))
data$action_to_mitigate_2___4.factor = factor(data$action_to_mitigate_2___4,levels=c("0","1"))
data$action_to_mitigate_2___5.factor = factor(data$action_to_mitigate_2___5,levels=c("0","1"))
data$action_to_mitigate_2___6.factor = factor(data$action_to_mitigate_2___6,levels=c("0","1"))
data$action_to_mitigate_2___7.factor = factor(data$action_to_mitigate_2___7,levels=c("0","1"))
data$action_to_mitigate_2___8.factor = factor(data$action_to_mitigate_2___8,levels=c("0","1"))
data$action_to_mitigate_2___9.factor = factor(data$action_to_mitigate_2___9,levels=c("0","1"))
data$action_to_mitigate_2___10.factor = factor(data$action_to_mitigate_2___10,levels=c("0","1"))
data$hospitalized.factor = factor(data$hospitalized,levels=c("1","2"))
data$icu.factor = factor(data$icu,levels=c("1","2"))
data$treatment_of_positive___1.factor = factor(data$treatment_of_positive___1,levels=c("0","1"))
data$treatment_of_positive___2.factor = factor(data$treatment_of_positive___2,levels=c("0","1"))
data$treatment_of_positive___3.factor = factor(data$treatment_of_positive___3,levels=c("0","1"))
data$treatment_of_positive___4.factor = factor(data$treatment_of_positive___4,levels=c("0","1"))
data$treatment_of_positive___5.factor = factor(data$treatment_of_positive___5,levels=c("0","1"))
data$treatment_of_positive___6.factor = factor(data$treatment_of_positive___6,levels=c("0","1"))
data$treatment_of_positive___7.factor = factor(data$treatment_of_positive___7,levels=c("0","1"))
data$alterbative_treatment.factor = factor(data$alterbative_treatment,levels=c("1","2"))
data$alterbative_treatment_2.factor = factor(data$alterbative_treatment_2,levels=c("1","2"))
data$social_dist.factor = factor(data$social_dist,levels=c("1","2","3","4"))
data$stay_home.factor = factor(data$stay_home,levels=c("1","2","3","4"))
data$family_affected.factor = factor(data$family_affected,levels=c("1","2"))
data$social_dist2.factor = factor(data$social_dist2,levels=c("1","2","3","4"))
data$stayhome2.factor = factor(data$stayhome2,levels=c("1","2","3","4"))
data$family_affected_2.factor = factor(data$family_affected_2,levels=c("1","2"))
data$symptoms_gr_2___1.factor = factor(data$symptoms_gr_2___1,levels=c("0","1"))
data$symptoms_gr_2___2.factor = factor(data$symptoms_gr_2___2,levels=c("0","1"))
data$symptoms_gr_2___3.factor = factor(data$symptoms_gr_2___3,levels=c("0","1"))
data$symptoms_gr_2___4.factor = factor(data$symptoms_gr_2___4,levels=c("0","1"))
data$symptoms_gr_2___5.factor = factor(data$symptoms_gr_2___5,levels=c("0","1"))
data$symptoms_gr_2___6.factor = factor(data$symptoms_gr_2___6,levels=c("0","1"))
data$symptoms_gr_2___7.factor = factor(data$symptoms_gr_2___7,levels=c("0","1"))
data$symptoms_gr_2___8.factor = factor(data$symptoms_gr_2___8,levels=c("0","1"))
data$symptoms_gr_2___9.factor = factor(data$symptoms_gr_2___9,levels=c("0","1"))
data$symptoms_gr_2___10.factor = factor(data$symptoms_gr_2___10,levels=c("0","1"))
data$symptoms_gr_2___11.factor = factor(data$symptoms_gr_2___11,levels=c("0","1"))
data$symptoms_gr_2___12.factor = factor(data$symptoms_gr_2___12,levels=c("0","1"))
data$source_info___1.factor = factor(data$source_info___1,levels=c("0","1"))
data$source_info___2.factor = factor(data$source_info___2,levels=c("0","1"))
data$source_info___7.factor = factor(data$source_info___7,levels=c("0","1"))
data$source_info___3.factor = factor(data$source_info___3,levels=c("0","1"))
data$source_info___4.factor = factor(data$source_info___4,levels=c("0","1"))
data$source_info___5.factor = factor(data$source_info___5,levels=c("0","1"))
data$source_info___6.factor = factor(data$source_info___6,levels=c("0","1"))
data$onset_of_symptom.factor = factor(data$onset_of_symptom,levels=c("1","2","3","4"))
data$reason_not_test___1.factor = factor(data$reason_not_test___1,levels=c("0","1"))
data$reason_not_test___2.factor = factor(data$reason_not_test___2,levels=c("0","1"))
data$reason_not_test___3.factor = factor(data$reason_not_test___3,levels=c("0","1"))
data$reason_not_test___4.factor = factor(data$reason_not_test___4,levels=c("0","1"))
data$reason_not_test___6.factor = factor(data$reason_not_test___6,levels=c("0","1"))
data$reason_not_test___5.factor = factor(data$reason_not_test___5,levels=c("0","1"))
data$symptom_mitigation___1.factor = factor(data$symptom_mitigation___1,levels=c("0","1"))
data$symptom_mitigation___2.factor = factor(data$symptom_mitigation___2,levels=c("0","1"))
data$symptom_mitigation___3.factor = factor(data$symptom_mitigation___3,levels=c("0","1"))
data$symptom_mitigation___4.factor = factor(data$symptom_mitigation___4,levels=c("0","1"))
data$symptom_mitigation___5.factor = factor(data$symptom_mitigation___5,levels=c("0","1"))
data$symptom_mitigation___6.factor = factor(data$symptom_mitigation___6,levels=c("0","1"))
data$symptom_mitigation___7.factor = factor(data$symptom_mitigation___7,levels=c("0","1"))
data$symptom_mitigation___8.factor = factor(data$symptom_mitigation___8,levels=c("0","1"))
data$alternative_trt.factor = factor(data$alternative_trt,levels=c("1","2"))
data$soc_dist.factor = factor(data$soc_dist,levels=c("1","2","3","4"))
data$stay_home_2.factor = factor(data$stay_home_2,levels=c("1","2","3","4"))
data$fam_affected_2.factor = factor(data$fam_affected_2,levels=c("1","2"))
data$risk_corona.factor = factor(data$risk_corona,levels=c("0","1","2","3","4","5"))
data$days_work_outside.factor = factor(data$days_work_outside,levels=c("0","1","2","3","4","5","6","7"))
data$soap_3.factor = factor(data$soap_3,levels=c("1","2","3","4"))
data$mask_3.factor = factor(data$mask_3,levels=c("1","2","3","4"))
data$soc_dist_3.factor = factor(data$soc_dist_3,levels=c("1","2","3","4"))
data$stay_home_3.factor = factor(data$stay_home_3,levels=c("1","2","3","4"))
data$prevent_measures.factor = factor(data$prevent_measures,levels=c("1","2"))
data$prevent_measures_2___1.factor = factor(data$prevent_measures_2___1,levels=c("0","1"))
data$prevent_measures_2___2.factor = factor(data$prevent_measures_2___2,levels=c("0","1"))
data$prevent_measures_2___12.factor = factor(data$prevent_measures_2___12,levels=c("0","1"))
data$prevent_measures_2___3.factor = factor(data$prevent_measures_2___3,levels=c("0","1"))
data$prevent_measures_2___4.factor = factor(data$prevent_measures_2___4,levels=c("0","1"))
data$prevent_measures_2___5.factor = factor(data$prevent_measures_2___5,levels=c("0","1"))
data$prevent_measures_2___6.factor = factor(data$prevent_measures_2___6,levels=c("0","1"))
data$prevent_measures_2___7.factor = factor(data$prevent_measures_2___7,levels=c("0","1"))
data$prevent_measures_2___8.factor = factor(data$prevent_measures_2___8,levels=c("0","1"))
data$prevent_measures_2___9.factor = factor(data$prevent_measures_2___9,levels=c("0","1"))
data$prevent_measures_2___10.factor = factor(data$prevent_measures_2___10,levels=c("0","1"))
data$prevent_measures_2___11.factor = factor(data$prevent_measures_2___11,levels=c("0","1"))
data$hyp_if_sympt_onset___1.factor = factor(data$hyp_if_sympt_onset___1,levels=c("0","1"))
data$hyp_if_sympt_onset___2.factor = factor(data$hyp_if_sympt_onset___2,levels=c("0","1"))
data$hyp_if_sympt_onset___3.factor = factor(data$hyp_if_sympt_onset___3,levels=c("0","1"))
data$hyp_if_sympt_onset___4.factor = factor(data$hyp_if_sympt_onset___4,levels=c("0","1"))
data$hyp_if_sympt_onset___5.factor = factor(data$hyp_if_sympt_onset___5,levels=c("0","1"))
data$hyp_if_sympt_onset___6.factor = factor(data$hyp_if_sympt_onset___6,levels=c("0","1"))
data$hyp_if_sympt_onset___7.factor = factor(data$hyp_if_sympt_onset___7,levels=c("0","1"))
data$hyp_if_sympt_onset___8.factor = factor(data$hyp_if_sympt_onset___8,levels=c("0","1"))
data$interest_on_test.factor = factor(data$interest_on_test,levels=c("1","2","3","4","5"))
data$why_not_tested_3___1.factor = factor(data$why_not_tested_3___1,levels=c("0","1"))
data$why_not_tested_3___2.factor = factor(data$why_not_tested_3___2,levels=c("0","1"))
data$why_not_tested_3___3.factor = factor(data$why_not_tested_3___3,levels=c("0","1"))
data$why_not_tested_3___4.factor = factor(data$why_not_tested_3___4,levels=c("0","1"))
data$why_not_tested_3___6.factor = factor(data$why_not_tested_3___6,levels=c("0","1"))
data$why_not_tested_3___5.factor = factor(data$why_not_tested_3___5,levels=c("0","1"))
data$starting_point_complete.factor = factor(data$starting_point_complete,levels=c("0","1","2"))

levels(data$consent.factor)=c("হ্যাঁ","না")
levels(data$sex.factor)=c("পুরুষ","মহিলা","অন্যান্য")
levels(data$education.factor)=c("প্রাথমিক","মাধ্যমিক","উচ্চ-মাধ্যমিক","স্নাতক","স্নাতকোত্তর","পিএইচডি ও সমমান","প্রাতিষ্ঠানিক শিক্ষা নেই")
levels(data$employment.factor)=c("চাকুরীজীবী","চিকিৎসক/ নার্স/ স্বাস্থ্যকর্মী","পুলিশ/সেনাবাহিনী/ আনসার/ মাঠপ্রশাসনে কর্মরত/ সাংবাদিক","ব্যাবসা","গৃহিণী","অবসরপ্রাপ্ত","শিক্ষার্থী","বেকার")
levels(data$zila.factor)=c("Bagerhat","Bandarban","Barguna","Barisal","Bhola","Bogra","Brahmanbaria","Chandpur","Chapainawabganj","Chittagong","Chuadanga","Comilla","Coxs Bazar","Dhaka","Dinajpur","Faridpur","Feni","Gaibandha","Gazipur","Gopalganj","Habiganj","Jamalpur","Jessore","Jhalokati","Jhenaidah","Joypurhat","Khagrachhari","Khulna","Kishoreganj","Kurigram","Kushtia","Lakshmipur","Lalmonirhat","Madaripur","Magura","Manikganj","Meherpur","Moulvibazar","Munshiganj","Mymensingh","Naogaon","Narail","Narayanganj","Narsingdi","Natore","Netrakona","Nilphamari","Noakhali","Pabna","Panchagarh","Patuakhali","Pirojpur","Rajbari","Rajshahi","Rangamati","Rangpur","Satkhira","Shariatpur","Sherpur","Sirajgonj","Sunamganj","Sylhet","Tangail","Thakurgaon")
levels(data$location.factor)=c("গ্রাম","উপজেলা শহর","জেলা শহর","বিভাগীয় শহর/সিটি")
levels(data$smoking.factor)=c("হ্যাঁ","না")
levels(data$income.factor)=c("১৫ হাজারের নিচে","১৫-২৫ হাজার এর মধ্যে","২৫-৫০ হাজার এর মধ্যে","৫০-৭৫ হাজার এর মধ্যে","৭৫ হাজার থেকে ১ লক্ষের মধ্যে","১ লক্ষের অধিক")
levels(data$comorbid___2.factor)=c("Unchecked","Checked")
levels(data$comorbid___13.factor)=c("Unchecked","Checked")
levels(data$comorbid___3.factor)=c("Unchecked","Checked")
levels(data$comorbid___4.factor)=c("Unchecked","Checked")
levels(data$comorbid___10.factor)=c("Unchecked","Checked")
levels(data$comorbid___11.factor)=c("Unchecked","Checked")
levels(data$comorbid___12.factor)=c("Unchecked","Checked")
levels(data$comorbid___5.factor)=c("Unchecked","Checked")
levels(data$comorbid___6.factor)=c("Unchecked","Checked")
levels(data$comorbid___7.factor)=c("Unchecked","Checked")
levels(data$comorbid___9.factor)=c("Unchecked","Checked")
levels(data$comorbid___14.factor)=c("Unchecked","Checked")
levels(data$blood_gr.factor)=c("এ+","এ-","বি+","বি-","ও+","ও-","এবি+","এবি-","জানা নেই")
levels(data$month_cov_pos.factor)=c("মার্চ","এপ্রিল","মে","জুন")
levels(data$month_cov_pos_2.factor)=c("মার্চ","এপ্রিল","মে","জুন")
levels(data$confusion_test.factor)=c("হ্যাঁ","না")
levels(data$long_process.factor)=c("পুরোপুরি একমত","কিছুটা একমত","নিরপেক্ষ","কিছুটা দ্বিমত","পুরোপুরি দ্বিমত")
levels(data$few_booths.factor)=c("পুরোপুরি একমত","কিছুটা একমত","নিরপেক্ষ","কিছুটা দ্বিমত","পুরোপুরি দ্বিমত")
levels(data$social_fear.factor)=c("পুরোপুরি একমত","কিছুটা একমত","নিরপেক্ষ","কিছুটা দ্বিমত","পুরোপুরি দ্বিমত")
levels(data$fear_quarantine.factor)=c("পুরোপুরি একমত","কিছুটা একমত","নিরপেক্ষ","কিছুটা দ্বিমত","পুরোপুরি দ্বিমত")
levels(data$i_will_not_get_virus.factor)=c("পুরোপুরি একমত","কিছুটা একমত","নিরপেক্ষ","কিছুটা দ্বিমত","পুরোপুরি দ্বিমত")
levels(data$covid_symptom___1.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___2.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___3.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___4.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___5.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___6.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___7.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___8.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___9.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___10.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___11.factor)=c("Unchecked","Checked")
levels(data$covid_symptom___12.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___1.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___2.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___3.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___4.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___5.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___6.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___7.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___8.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___9.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate___10.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___1.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___2.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___3.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___4.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___5.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___6.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___7.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___8.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___9.factor)=c("Unchecked","Checked")
levels(data$action_to_mitigate_2___10.factor)=c("Unchecked","Checked")
levels(data$hospitalized.factor)=c("হ্যাঁ","না")
levels(data$icu.factor)=c("হ্যাঁ","না")
levels(data$treatment_of_positive___1.factor)=c("Unchecked","Checked")
levels(data$treatment_of_positive___2.factor)=c("Unchecked","Checked")
levels(data$treatment_of_positive___3.factor)=c("Unchecked","Checked")
levels(data$treatment_of_positive___4.factor)=c("Unchecked","Checked")
levels(data$treatment_of_positive___5.factor)=c("Unchecked","Checked")
levels(data$treatment_of_positive___6.factor)=c("Unchecked","Checked")
levels(data$treatment_of_positive___7.factor)=c("Unchecked","Checked")
levels(data$alterbative_treatment.factor)=c("হ্যাঁ","না")
levels(data$alterbative_treatment_2.factor)=c("হ্যাঁ","না")
levels(data$social_dist.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা হয়নি")
levels(data$stay_home.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা হয়নি")
levels(data$family_affected.factor)=c("হ্যাঁ","না")
levels(data$social_dist2.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা হয়নি")
levels(data$stayhome2.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা হয়নি")
levels(data$family_affected_2.factor)=c("হ্যাঁ","না")
levels(data$symptoms_gr_2___1.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___2.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___3.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___4.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___5.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___6.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___7.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___8.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___9.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___10.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___11.factor)=c("Unchecked","Checked")
levels(data$symptoms_gr_2___12.factor)=c("Unchecked","Checked")
levels(data$source_info___1.factor)=c("Unchecked","Checked")
levels(data$source_info___2.factor)=c("Unchecked","Checked")
levels(data$source_info___7.factor)=c("Unchecked","Checked")
levels(data$source_info___3.factor)=c("Unchecked","Checked")
levels(data$source_info___4.factor)=c("Unchecked","Checked")
levels(data$source_info___5.factor)=c("Unchecked","Checked")
levels(data$source_info___6.factor)=c("Unchecked","Checked")
levels(data$onset_of_symptom.factor)=c("মার্চ","এপ্রিল","মে","জুন")
levels(data$reason_not_test___1.factor)=c("Unchecked","Checked")
levels(data$reason_not_test___2.factor)=c("Unchecked","Checked")
levels(data$reason_not_test___3.factor)=c("Unchecked","Checked")
levels(data$reason_not_test___4.factor)=c("Unchecked","Checked")
levels(data$reason_not_test___6.factor)=c("Unchecked","Checked")
levels(data$reason_not_test___5.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___1.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___2.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___3.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___4.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___5.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___6.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___7.factor)=c("Unchecked","Checked")
levels(data$symptom_mitigation___8.factor)=c("Unchecked","Checked")
levels(data$alternative_trt.factor)=c("হ্যাঁ","না")
levels(data$soc_dist.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা হয়নি")
levels(data$stay_home_2.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা হয়নি")
levels(data$fam_affected_2.factor)=c("হ্যাঁ","না")
levels(data$risk_corona.factor)=c("অত্যন্ত উচ্চ-ঝুঁকিপুর্ণঃ আমার পরিবারের সদস্য আক্রান্ত হয়েছেন","উচ্চ-ঝুঁকিপুর্ণঃ আমাদের দালানে আক্রান্ত রোগী আছে","ঝুঁকিপুর্ণঃ প্রতিবেশীদের মধ্যে আক্রান্ত রোগী আছে","মধ্যম-ঝুঁকিপুর্ণঃ আমার এলাকায় আক্রান্ত রোগী আছে","নিম্ন-ঝুঁকিপুর্ণঃ আত্মীয়/বন্ধুবান্ধব আক্রান্ত হয়েছেন কিন্ত তারা অন্য এলাকায় থাকেন","সর্বনিম্ন-ঝুঁকিপুর্ণঃ আমার পরিবার/বন্ধুবান্ধব/প্রতিবেশী/আমাদের এলাকা/আশেপাশের এলাকার মধ্যে কেউ আক্রান্ত হয়নি এবং আমি কঠোর ভাবে সামাজিক/ শারীরিক দূরত্ব মেনে চলি")
levels(data$days_work_outside.factor)=c("যেতে হয় না","১ দিন","২ দিন","৩ দিন","৪ দিন","৫ দিন","৬ দিন","৭ দিন")
levels(data$soap_3.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা যায়নি")
levels(data$mask_3.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা যায়নি")
levels(data$soc_dist_3.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা যায়নি")
levels(data$stay_home_3.factor)=c("সবসময়","বেশিরভাগ সময়","মাঝে মাঝে","একদম মানা যায়নি")
levels(data$prevent_measures.factor)=c("হ্যাঁ","না")
levels(data$prevent_measures_2___1.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___2.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___12.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___3.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___4.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___5.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___6.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___7.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___8.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___9.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___10.factor)=c("Unchecked","Checked")
levels(data$prevent_measures_2___11.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___1.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___2.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___3.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___4.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___5.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___6.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___7.factor)=c("Unchecked","Checked")
levels(data$hyp_if_sympt_onset___8.factor)=c("Unchecked","Checked")
levels(data$interest_on_test.factor)=c("অনেক বেশী","বেশি","কমও নয়, বেশিও নয়","কম","একদম ইচ্ছা নেই")
levels(data$why_not_tested_3___1.factor)=c("Unchecked","Checked")
levels(data$why_not_tested_3___2.factor)=c("Unchecked","Checked")
levels(data$why_not_tested_3___3.factor)=c("Unchecked","Checked")
levels(data$why_not_tested_3___4.factor)=c("Unchecked","Checked")
levels(data$why_not_tested_3___6.factor)=c("Unchecked","Checked")
levels(data$why_not_tested_3___5.factor)=c("Unchecked","Checked")
levels(data$starting_point_complete.factor)=c("Incomplete","Unverified","Complete")
