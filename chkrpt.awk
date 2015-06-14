
function box(text, size){
	textlen = length(text);
	if (textlen > size){
		ret = substr(text,1,size);
	}else if (textlen <= size){
		ret = text;
		for(i=0;i<size-textlen;i++){
			ret = ret " ";
		}
	}
	return ret;
}
function abs(val,    locval){
	if (val < 0) locval += val + (val * -2);
	else locval = val;
	return locval;
}
function printbars(desc, amt, numerator,   barsprinted){
	printf box(desc abs(amt), 30);
	for(i=1; i<abs(amt)/numerator; i++){
		barsprinted++;
		printf ("|");
	}
	if ( !barsprinted)
		printf ("|");
		
	printf("\n");
}
function printamt(desc, amt){
	if (amt==0) amt=0;
	if(barnumerator){
		printbars(desc, amt, barnumerator);
	}else{
		print desc ": " abs(amt);	
	}
}

function printcat(desc, arrrec, amt){
	printf("\n\n");
	print("***" desc abs(amt) " ***");
	for(i=0; arrrec[i] != ""; i++){
		print arrrec[i];
	}
}
BEGIN{FS=" \|\| "; barnumerator = 10; fndix=0}
wasfound=0;
{
	daterange[++daterangeix]= $1;
}

$3 !~ /\*/ {print $0;}

tolower($5) ~ /tempe cust svc-util/ {arrwater[waterix++] = $0; water =  water + $2; cntfound++; wasfound++;} 

tolower($5) ~ /turbotax|irs/ {arrgovment[govmentix++] = $0; govment =  govment + $2; cntfound++; wasfound++;} 

tolower($5) ~ /save darfur|oxfam/ {arrcharity[charityix++] = $0; charity =  charity + $2; cntfound++; wasfound++;} 

tolower($5) ~ /l\.j\.m\. air|art\.com|asian import|sierra cooling/ {arrhomerep[homerepix++] = $0; homerep =  homerep + $2; cntfound++; wasfound++;} 

tolower($5) ~ /national home protect|instant certified appr|old republic home|countrywide mort|hoa|homecomings fina|premier inspect|citimort/ {arrmort[mortix++] = $0; mort =  mort + $2; cntfound++; wasfound++;} 

tolower($5) ~ /kinko's|u-haul|fly scooter|1 and 1|town and country|hms.*host|yankee candle|usps|overdraft protection|savings overdraft|checks in the ma|levy@awa|mr. bon|sy8 world|globalware sftware|info.kagi.com/ {arrmisc[miscix++] = $0; misc =  misc + $2; cntfound++; wasfound++;} 

tolower($5) ~ /markson j r/ {arrsec[secix++] = $0; sec =  sec + $2; cntfound++; wasfound++;} 

tolower($5) ~ /east valley primary ca|banner desert|new horiz|eyecare|john julius|mayo hospital|mca patient|fiesta express|urgent care/ {arrmed[medix++] = $0; med =  med + $2; cntfound++; wasfound++;} 

tolower($5) ~ /tempe library/ {arrtempelib[tempelibix++] = $0; tempelib =  tempelib + $2; cntfound++; wasfound++;} 

tolower($5) ~ /alabama vital rec|service arizona mvd|usps change of address|motor vehic/ {arrtax[taxix++] = $0; tax =  tax + $2; cntfound++; wasfound++;} 

$5 ~ /INTEREST PAYMENT/  {arrinter[interix++] = $0; inter =  inter + $2; cntfound++; wasfound++;} 

$5 ~ /ONLINE TRANSFER FROM|RECURRING TRANSFER/  {arrtransfrom[transfromix++] = $0; transfrom =  transfrom + $2; cntfound++; wasfound++;} 

$5 ~ /ONLINE TRANSFER TO/  {arrtransto[transtoix++] = $0; transto =  transto + $2; cntfound++; wasfound++;} 

$5 ~ /HFC|PAYMENT TO BEN/ 			    {arrfurnature[furnatureix++] = $0; furnature =  furnature + $2; cntfound++; wasfound++;} 

$5 ~ /DEPOSIT/ 			    {arrdepos[deposix++] = $0; depos =  depos + $2; cntfound++; wasfound++;} 

tolower($5) ~ /online transfer ref/ {arrsave[saveix++] = $0; save =  save + $2; cntfound++; wasfound++;} 

tolower($5) ~ /pc club|simply laptops|gizmobies|fry's electron|best buy|radio shack|audio express/ {arrfryselec[fryselecix++] = $0; fryselec =  fryselec + $2; cntfound++; wasfound++;} 

tolower($5) ~ /srp/ {arrsrp[srpix++] = $0; srp =  srp + $2; cntfound++; wasfound++;} 

tolower($5) ~ /qwestcomm/ {arrphone[phoneix++] = $0; phone =  phone + $2; cntfound++; wasfound++;} 

tolower($5) ~ /cingular|at&t qd|at&t payment/ {arrcell[cellix++] = $0; cell =  cell + $2; cntfound++; wasfound++;} 

tolower($5) ~ /barnesnoble|borders book|time mag|magazne|barnes & nob|sciam|olssons books|changing han|stitcher's closet|everything xs|stoney creek collectio|amazon|changing hands|amzn\.com|broad voc|mc linux journal|desertcany/ {arrbook[bookix++] = $0; book =  book + $2; cntfound++; wasfound++;} 

tolower($5) ~ /old navy|pacsun|zumiez|aeropostale|sou ross stor|gap|industrial ride|carter's|payless|anchor blue|forever21|afterthoughts|victoria|foreve|shirts n things|charlotte|hot topic|jcpenn|new york & company|rei|shoe trader|urban outfitte/ {arrgloth[clothix++] = $0; cloth =  cloth + $2; cntfound++; wasfound++;} 

tolower($5) ~ /banfield|petco|reptilefood|petsmart|pets,* inc/ {arrpet[petix++] = $0; pet =  pet + $2; cntfound++; wasfound++;} 


tolower($5) ~ /konga juice|old chicago pasta|taco bel|olive gard|garcia's|baja fresh|someburros|quiznos|wildflower bread|moes southwest|sonic drive in|wild noodles|outback|pf changs|atlanta bread|macaroni.*gr|chili'?s|pei ?wei|fudd.*ruck|pita.*j|yc.*mongolian|panda ?ex|bahama ?breeze|schlotzsky|cinnabon|yuph|paradise|samurai sams|rula bula|boston market|mimis cafe|barro's pizza|boston's gourmet|mary coyle|tempe hooters|arby's|el pollo|bison witches|nothing but nood|tgi friday|mousouth|hyatt hot|macayo|t\.g\.i|chipotle|chuys|subway|baskin robbins|cheesecake|tcby|az bread|nello|thaifoon|pizza hut|mimo's|sukihana|p.f. chang|portland|rainforest|sweet tomatoes|on the border|coco moka|sunshine tree terra lake buena|emporium complex lake buena|tejas|thai basil|fairytale brownies|coldstn cream|frenchmans reef|my big fat greek|oregano's tempe|papa johns|picazzos gourmet|jasons deli|buca di beppo|pestos pizza|blue mesa taco|tony s town square|tilted kilt|green tempe az|paradies|kasha|carumba|obriens rest|galeria pizza|anise/ {arreatout[eatoutix++] = $0; eatout =  eatout + $2; cntfound++; wasfound++;} 
tolower($5) ~ /kobe|sbarros|hungry how|sun chinese|kcf|aunt chiladas|quizno|hard rock|anita cook/ {arreatout[eatoutix++] = $0; eatout =  eatout + $2; cntfound++; wasfound++;} 



tolower($5) ~ /bath & body|water 2|basha|costco whse|water plus|water'n ice|safeway|frys food|spark food mart|whole ?food|auk mor|pepperwood water|dac general|frys-food-drg|albertsons|sunflower|sprout|walgreen|gentle strength|whilefds/ {arrgroc[grocix++] = $0; groc =  groc + $2; cntfound++; wasfound++;} 


tolower($5) ~ /gloria jeans|campus coffee|star ?buck|coffee plantation/ {arrstarbucks[starbucksix++] = $0; starbucks =  starbucks + $2; cntfound++; wasfound++;} 

tolower($5) ~ /wal-*mart|target|kohl/ {arrwalmart[walmartix++] = $0; walmart =  walmart + $2; cntfound++; wasfound++;} 

tolower($5) ~ /itune|netflix++|blockbuster|cirque|harkins|tower of london|virgin mega|axis.*radius|gameworks|magazine|1 & 1|expedia|magic kingdom|united air|fascinations|coral world|island news|rosen shingle|continental|dest univ|pandora york|foreign curr conv|preclearance to custom|american ai|waterfront warehouse|phoenix airport|rest wave carolina|resort adventure cente|zoo|amc|go concessions|venetian showroom|hollywood video/ {arrentertain[entertainix++] = $0; entertain =  entertain + $2; cntfound++; wasfound++;} 

tolower($5) ~ /discount.*tire|autozone/ {arrcarmaint[carmaintix++] = $0; carmaint =  carmaint + $2; cntfound++; wasfound++;} 

tolower($5) ~ /sear/ {arrsears[searsix++] = $0; sears =  sears + $2; cntfound++; wasfound++;} 

tolower($5) ~ /stitches n|bed, bath|gracies|joann|ikea|linenstempe|allpost|overstock\.com|costplus|wild things|the home desou|lowe's|mervyns|picture perfect|michaels|linensnthings|batteries plus|staples|pier 1|factory direct|tillie's attic|mexican arts|1-2-3 stitch|jeremiah junction/ {arrhomeimprove[homeimproveix++] = $0; homeimprove =  homeimprove + $2; cntfound++; wasfound++;} 

tolower($5) ~ /osco|cvs/ {arrosco[oscoix++] = $0; osco =  osco + $2; cntfound++; wasfound++;} 

tolower($5) ~ /withdrawal made in a branch\/store|^check$|^cashed check$/ {arrcheck[checkix++] = $0; check =  check + $2; cntfound++; wasfound++;} 

tolower($5) ~ /non-wells fargo atm transaction fee|atm withdrawal/ {arratmnw[atmnwix++] = $0; atmnw =  atmnw + $2; cntfound++; wasfound++;} 

tolower($5) ~ /atm.*sim/ {arratmsim[atmsimix++] = $0; atmsim =  atmsim + $2; cntfound++; wasfound++;} 

tolower($5) ~ /saguaro.*family/ {arrdoctor[doctorix++] = $0; doctor =  doctor + $2; cntfound++; wasfound++;} 

tolower($5) ~ /spencer|billmatrix++|guitar cent|toys r us|dolrtree|carlton cards|utility board|1&1|vegan unlimited|macys|slanket|disney/ {arrjustbecause[justbecauseix++] = $0; justbecause =  justbecause + $2; cntfound++; wasfound++;} 

tolower($5) ~ /arizona hair co|kisses nail|claire's b|merle norman|fantastic sams|beauty.*exp|kisses nails|the body shop/ {arrbeauty[beautyix++] = $0; beauty =  beauty+ $2; cntfound++; wasfound++;} 

tolower($5) ~ /simula inc/ {arrdelchk[delchkix++] = $0; delchk =  delchk + $2; cntfound++; wasfound++;} 

tolower($5) ~ /dac payroll|direct alliance payroll|finance charge\*payment for dd adv on/ {arrjeschk[jeschkix++] = $0; jeschk =  jeschk + $2; cntfound++; wasfound++;} 

tolower($5) ~ /wachovia|nissan|wfs financial/ {arrnissan[nissanix++] = $0; nissan =  nissan + $2; cntfound++; wasfound++;} 

tolower($5) ~ /progressive|allstate/ {arrprogressive[progressiveix++] = $0; progressive =  progressive + $2; cntfound++; wasfound++;} 

tolower($5) ~ /amfam/ {arramfam[amfamix++] = $0; amfam =  amfam + $2; cntfound++; wasfound++;} 

tolower($5) ~ /cox/ {arrcox[coxix++] = $0; cox =  cox + $2; cntfound++; wasfound++;} 

rolower($5) ~ /audible/ {arraud[audix++] = $0; aud =  aud + $2; cntfound++; wasfound++;} 

tolower($5) ~ /la.*fit/ {arrfit[fitix++] = $0; fit =  fit + $2; cntfound++; wasfound++;} 

tolower($5) ~ /express cleaner|dirtelaundry.com/ {arrclean[cleanix++] = $0; clean =  clean + $2; cntfound++; wasfound++;} 

tolower($5) ~ /extra space/ {arrstore[storeix++] = $0; store =  store + $2; cntfound++; wasfound++;} 

tolower($5) ~ /zia records/ {arrcds[cdsix++] = $0; cds =  cds + $2; cntfound++; wasfound++;} 

tolower($5) ~ /7-eleven|shell oil|circle k|arco paypoint|costco gas|shell service|qt|break time|exxonmob|speedpay|chevron|union 76/ {arrquickymart[quickymartix++] = $0; quickymart =  quickymart + $2; cntfound++; wasfound++;} 
{
	if (!wasfound){
		if ($0 != "")
			unfound[fndix++]=$0;
	}
}

wasfound=0;

END{
	cntunfound  = NR-cntfound;
	start = daterange[daterangeix];
	fin = daterange[1];
	printf ("Checking Account Report for %s thru %s\n\n", start, fin);

	printf("Delia income: %s\n", delchk);
	printf ("Jesse income: %s\n\n", jeschk);
	
	printamt("AMFAM: ", amfam);
	printamt("ATM (non-wells): ", atmnw);
	printamt("ATM Simula: ", atmsim);
	printamt("Audible: ", aud);
	printamt("Beauty: ", beauty);
	printamt("Books: ", book);
	printamt("Credit Cards: ", cred);
	printamt("Car maint: ", carmaint);
	printamt("Cell: ", cell);
	printamt("Charity", charity);
	printamt("Checks/Withdraw: ", check);
	printamt("Cleaners: ", clean);
	printamt("Cloths: ", cloth);
	printamt("Depos: ", depos);
	printamt("Eat out: ", eatout);
	printamt("Entertainment: ", entertain);
	printamt("Fitness: ", fit);
	printamt("Frys Elec: ", fryselec);
	printamt("Furnature: ", furnature);
	printamt("Groceries: ", groc);
	printamt("Just because: ", justbecause);
	printamt("Home improve: ", homeimprove);
	printamt("Home repair: ", homerep);
	printamt("Medical: ", med);
	printamt("Misc: ", misc);
	printamt("Music: ", cds);
	printamt("Mortgage: ", mort);
	printamt("Nissan: ", nissan);
	printamt("Osco: ", osco);
	printamt("Pets: ", pet);
	printamt("Phone: ", phone);
	printamt("Progressive: ", progressive);
	printamt("Quickymart (gas): ", quickymart);
	printamt("Sears: ", sears);
	printamt("SRP: ", srp);
	printamt("Starbucks: ", starbucks);
	printamt("Storage: ", store);
	printamt("Security: ", sec);
	printamt("Transfers To: ", transto);
	printamt("Transfers From: ", transfrom);
	printamt("Walmart: ", walmart);

	printf("\n"); 
	print "Total Recs: " NR;
	print "Uncategorized records: " fndix;

	for(rec in unfound){
		print "\t " unfound[rec];
	}

	printcat("AMFAM ", arramfam, amfam);
	printcat("ATM (non-wells) ", arratmnw, atmnw);
	printcat("ATM Simula ", arratmsim, atmsim);
	printcat("Audible ", arraud, aud);
	printcat("Beauty ", arrbeauty, beauty);
	printcat("Books ", arrbook, book);
	printcat("Charity ", arrcharity, charity);
	printcat("Credit Cards ", arrcred, cred);
	printcat("Car maint ", arrcarmaint, carmaint);
	printcat("Cell ", arrcell, cell);
	printcat("Checks/Withdraw ", arrcheck, check);
	printcat("Cleaners ", arrclean, clean);
	printcat("Cloths ", arrcloth, cloth);
	printcat("Depos ", arrdepos, depos);
	printcat("Eat out ", arreatout, eatout);
	printcat("Entertainment ", arrentertain, entertain);
	printcat("Fitness ", arrfit, fit);
	printcat("Frys Elec ", arrfryselec, fryselec);
	printcat("Furnature ", arrfurnature, furnature);
	printcat("Govment ", arrgovment, govment);
	printcat("Groceries ", arrgroc, groc);
	printcat("Just because ", arrjustbecause, justbecause);
	printcat("Home improve ", arrhomeimprove, homeimprove);
	printcat("Home repair ", arrhomerep, homerep);
	printcat("Medical ", arrmed, med);
	printcat("Misc ", arrmisc, misc);
	printcat("Mortgage ", arrmort, mort);
	printcat("Music ", arrcds, cds);
	printcat("Nissan ", arrnissan, nissan);
	printcat("Osco ", arrosco, osco);
	printcat("Pets ", arrpet, pet);
	printcat("Phone ", arrphone, phone);
	printcat("Progressive ", arrprogressive, progressive);
	printcat("Quickymart (gas) ", arrquickymart, quickymart);
	printcat("Sears ", arrsears, sears);
	printcat("Security ", arrsec, sec);
	printcat("SRP ", arrsrp, srp);
	printcat("Starbucks ", arrstarbucks, starbucks);
	printcat("Storage ", arrstore, store);
	printcat("Transfers To ", arrtransto, transto);
	printcat("Transfers From ", arrtransfrom, transfrom);
	printcat("Walmart ", arrwalmart, walmart);
	printcat("Water ", arrwater, water);

}

