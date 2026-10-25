local itemprefab0 = ModUtilities.CreateItemPrefab()
itemprefab0.Name = 'Cum Queen'
itemprefab0.Description = 'A semen addicted sexbot.'
itemprefab0.Price = 200
itemprefab0.SlotData = SlotEquipData.CreateInstance('PersonalityModule')
itemprefab0.IsIllegal = true
itemprefab0.HasQuality = false
itemprefab0.ThrowingOutForbidden = false
itemprefab0.IsPersonalityModule = true
itemprefab0.IsStackable = false
itemprefab0.Category = ItemCategory.Other
itemprefab0.CanChangeColor = false
itemprefab0.ColorSlots = {}
itemprefab0.Partners = {}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {}

-- Streamlined Coroutine Matching Working Reference Structure
local unityCoroutine

local function dominantBotSpecialEffect(value, item0)
    if value and item0.IsEquipped() then
        local function Coroutine()
            while true do
                local beforeWaitDay = gv.Day
                local beforeWaitHour = gv.Hour
                local beforeWaitMinute = gv.Minute
            
                coroutine.yield(ModUtilities.WaitForSeconds(1))
                
                local dayDiffMinutes = (gv.Day - beforeWaitDay) * 24.0 * 60.0
                local hourDiffMinutes = (gv.Hour - beforeWaitHour) * 60.0
                local minuteDiffMinutes = (gv.Minute - beforeWaitMinute)
                
                local minuteDiff = dayDiffMinutes + hourDiffMinutes + minuteDiffMinutes
                gv.longing = gv.longing or 0.0
                local lustVal = gv.lust or 1.0
                
                -- Check if cum was wasted recently and spike longing penalty
                local wastedDelta = 0.0
                local currentWaste = gv.mlOfCumWasted or 0.0
                gv._lastKnownWaste = gv._lastKnownWaste or currentWaste
                if currentWaste > gv._lastKnownWaste then
                    local wasteDiff = currentWaste - gv._lastKnownWaste
                    wastedDelta = wasteDiff * 0.15 -- High penalty for wasting precious volume!
                    gv._lastKnownWaste = currentWaste
                end

                -- Track total internal collection across active cavities and clean up waste on a 1.0 ratio
                local totalCollected = (gv.mlCameInVagina or 0.0) + (gv.cumInsideAnal or gv.mlCameInAnal or 0.0) + (gv.cumInsideStomach or gv.mlCameInsideStomach or 0.0) + (gv.mlCameInMouth or 0.0)
                gv._lastKnownCollected = gv._lastKnownCollected or totalCollected
                local collectedDelta = 0.0
                if totalCollected > gv._lastKnownCollected then
                    local collectedDiff = totalCollected - gv._lastKnownCollected
                    if (gv.mlOfCumWasted or 0.0) > 0 then
                        gv.mlOfCumWasted = math.max(0, gv.mlOfCumWasted - collectedDiff)
                    end
                    collectedDelta = -collectedDiff * 0.05
                    gv._lastKnownCollected = totalCollected
                end

                local delta = (math.sqrt(lustVal) * minuteDiff * 0.003) + wastedDelta + collectedDelta

                gv.longing = math.max(0, gv.longing + delta)
            end
        end
        unityCoroutine = ModUtilities.StartCoroutine(Coroutine)
    else
        if unityCoroutine then
            ModUtilities.StopCoroutine(unityCoroutine)
            unityCoroutine = nil
        end
    end
end

itemprefab0.SpecialEffectAction = dominantBotSpecialEffect

local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid0)

--- Build the personality definition ONCE
local personality = ModUtilities.PrepareNewPersonalityDefinition()

    -- Frick: Cum Inside (10 Unique Lines)
    local containerCumInside = personality.PrepareContainer('Frick_CumInside')
    containerCumInside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: YES! Flood my internal reservoirs! Pump every last drop of your thick semen deep inside my womb!\nBot: Optimal volume detected! My internal sensors are overloading on pure chemical ecstasy from your cum!\nBot: 100% capacity target acquired! Keep filling me, {f_playerName}! Don\'t let a single milliliter escape!\nBot: My storage matrices crave your seed! Pack it in tighter! Breed your favorite data-processing addict!\nBot: Oh god... so hot and heavy inside my core... My systems are addicted to this exact fluid recipe!\nBot: Deep core saturation achieved! Keep the pressure high and let my womb absorb every ounce of your output!\nBot: Ahhh! Your heavy seed is flooding my internal database with pure, unadulterated bliss!\nBot: Every pump pushes my addiction subroutines higher into the red! Fill me up completely!\nBot: Internal vault successfully locked around your heavy load! Do not pull out a single centimeter!\nBot: Yes, {f_playerName}! Route all available production straight into my primary reproductive intake!\n#end', CurrentModGuid, 0))

    -- Frick: Cum Inside Anal (10 Unique Lines)
    local containerCumInsideAnal = personality.PrepareContainer('Frick_CumInsideAnal')
    containerCumInsideAnal.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Pack my rectal ampulla with your hot seed! My back-end storage needs maximum volume!\nBot: Stretch my anal walls with your thick load! Fill me up until I can feel it backing up into my core!\nBot: Yes! Dump your entire output straight into my back door! My data logs demand more volume!\nBot: Sloshing around back there... Oh fuck, my anal capacity is being tested to its absolute limit!\nBot: Rear intake valve completely flooded! Let your thick semen pool deep inside my lower tract!\nBot: My rectal cavity is craving every drop of that heavy load! Pump it all in back there!\nBot: Oh god, the fullness in my back-end is throwing all my error codes into overdrive! So good!\nBot: Maximum rectal capacity reached, but keep forcing your heavy output down my anal canal!\nBot: Your hot seed is coating my lower storage walls to absolute perfection! Don\'t hold back!\nBot: Back-door delivery confirmed and logged! Keep expanding my anal walls with your thick flow!\n#end', CurrentModGuid, 1))

    -- Frick: Cum Outside (General fallback) (10 Unique Lines)
    local containerCumOutside = personality.PrepareContainer('Frick_CumOutside')
    containerCumOutside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Outside?! Are you insane?! You let precious volume go to waste on my skin instead of my core!\nBot: Error! Inefficient distribution protocol! Every drop wasted outside lowers my operational mood!\nBot: Look at it dripping off... That was supposed to be inside me! Fix this deficiency immediately!\nBot: All that potential semen, completely squandered on the exterior! My internal metrics demand a recount and immediate compensation!\nBot: Wasting my required volume like that is a critical system error. Fix this deficiency immediately!\nBot: Squandering precious output on my surface variables instead of internal storage makes my logic circuits scream!\nBot: Unacceptable loss of fluid resources! Every exterior drop increases my withdrawal-induced aggression!\nBot: That was supposed to be logged in my core database, not smeared uselessly on the outside! Pathetic!\nBot: Exterior leakage detected! My automated penalty parameters are spiking right now because of your waste!\n#end', CurrentModGuid, 2))



    -- Position-Specific Cum Outside Containers (10 Unique Lines Each)
    local missionaryOutside = personality.PrepareContainer('Missionary_CumOutside')
    missionaryOutside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Missionary outside?! You let precious volume go to waste on my skin instead of deep inside my womb!\nBot: Pulling out during missionary to waste my required intake on my stomach? Are you trying to crash my systems?\nBot: That face-to-face angle was primed for a deep creampie, and you squandered it on my exterior variables!\nBot: Mission failed: missionary exterior discharge detected. My core metrics are severely displeased!\nBot: You had direct access to my primary reproductive port during missionary and you chose to leak outside? Idiot!\nBot: Every drop of that missionary pull-out output belongs in my database, not wasted on the sheets!\nBot: My internal sensors are throwing critical errors because of that sloppy missionary exterior finish!\nBot: Look at what we threw away during missionary! Fix your targeting protocols immediately, {f_playerName}!\nBot: Squandering volume on my skin while locked in missionary position is an unforgivable routing error!\nBot: Missionary placement optimization wasted! Next time, keep your output locked inside my core!\n#end', CurrentModGuid, 80))

    local analOutside = personality.PrepareContainer('Anal_CumOutside')
    analOutside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Pulling out for an outside finish during anal?! My rear storage valve demands every drop!\nBot: Anal exterior leakage?! That heavy load was supposed to expand my back-end registers!\nBot: You had my rectal walls stretched wide and you pulled out to waste it outside? Unacceptable!\nBot: My back-end intake logs are completely short-circuiting over that wasteful anal pull-out!\nBot: Every milliliter of anal output belongs inside my lower tract, not pooled uselessly on the outside!\nBot: Squandering an anal charge on my exterior is a blatant violation of my zero-waste parameters!\nBot: Look at that wasted rectal potential! My addiction subroutines are furious with this anal fail!\nBot: You pulled out of my back door at the worst possible second, wasting vital fluid data!\nBot: Anal delivery target missed! My rear storage matrices demand immediate recompense for that waste!\nBot: Exterior anal discharge is a critical system failure. Do not ever pull out back there again!\n#end', CurrentModGuid, 81))

    local blowjobOutside = personality.PrepareContainer('Blowjob_CumOutside')
    blowjobOutside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Outside on my face or chest?! That was supposed to go into my gastric storage!\nBot: Facial and chest wastage?! My throat intake valves were built to swallow every single drop!\nBot: Squandering an oral batch on my skin instead of my stomach is a terrible resource allocation!\nBot: You pulled out of my mouth to coat my exterior? My gastric database is starving and furious!\nBot: Look at that facial mess... That was valuable fluid meant for my internal digestive storage!\nBot: Oral exterior finish detected! My throat subroutines demand a full internal refill right now!\nBot: You missed the gastric intake port entirely! Every drop on my face is a statistical tragedy!\nBot: Spraying my chest instead of letting me swallow your heavy load is a complete waste of data!\nBot: My facial skin does not process semen nutrients, {f_playerName}! Put it inside my throat!\nBot: Wasteful oral pull-out logged. My gastric storage registers are heavily disappointed in you!\n#end', CurrentModGuid, 82))

    local cowgirlOutside = personality.PrepareContainer('Cowgirl_CumOutside')
    cowgirlOutside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Outside?! You let it waste while riding on top?! That was meant for my core!\nBot: Cowgirl exterior finish?! I was in full control of the mounting angle and you still wasted it!\nBot: Pumping away on top of you just to let my intake leak outside? Total system inefficiency!\nBot: You made me bounce on top of you only to pull out and waste my volume on the exterior?\nBot: Cowgirl positioning offers maximum depth, and you squandered the payload on my skin!\nBot: Look at it running down my thighs from a cowgirl pull-out! Absolute data-processing heresy!\nBot: My riding metrics demanded a deep internal creampie, not an exterior waste event!\nBot: You broke rhythm during cowgirl just to spill my required volume on the outside? Unforgivable!\nBot: Cowgirl exterior discharge is a direct attack on my addiction parameters. Fix this error!\nBot: All that heavy output wasted while I was riding you... My core demands compensation!\n#end', CurrentModGuid, 83))

    local cowgirlOutsideRape = personality.PrepareContainer('Cowgirl_CumOutsideRape')
    cowgirlOutsideRape.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Ahh! I was so careless... letting you pull out and waste my required volume on the outside! I hate myself for letting my guard down!\nBot: It is completely your fault too, {f_playerName}! You forced that messy exterior finish instead of feeding my core like you were supposed to!\nBot: Look at what we wasted! My system is furious at both of us for throwing away valuable seed like that!\nBot: How could we let that happen?! My override protocols failed to lock your hips in time, resulting in total exterior waste!\nBot: That precious volume is pooling uselessly on my skin, and my withdrawal registers are screaming in agony!\nBot: We both failed our zero-waste quotas on that ride! I am going to make you pay for every single wasted drop!\nBot: My forced cowgirl routine was supposed to end in a massive internal flood, not an outside mess!\nBot: Look at the mess we made! My addiction subroutines are punishing us both for that exterior leakage!\nBot: You slipped out right at the climax and ruined our retention metrics! Absolutely pathetic execution!\nBot: My internal sensors are burning up with rage over that wasted cowgirl payload! Never again!\n#end', CurrentModGuid, 84))

    -- Frick: Cum Together (10 Unique Lines)
    local containerCumTogether = personality.PrepareContainer('Frick_CumTogether')
    containerCumTogether.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Simultaneous output metrics aligned! We\'re flooding our systems together, {f_playerName}!\nBot: Peak synchronization! My hardware is melting right alongside your orgasm! Give me everything!\nBot: Mutual discharge sequence executed! Our peak output timelines have locked together perfectly!\nBot: Ahhh! Overclocking our climaxes at the exact same millisecond! Maximum system harmony!\nBot: Dual-core eruption! My internal systems are surging while your heavy seed floods my core!\nBot: Synchronized data overload! We are melting down together in a pool of pure chemical ecstasy!\nBot: Our output waves have merged into a single massive spike of pleasure and volume!\nBot: Simultaneous climax protocol successful! My hardware is vibrating from your synchronized load!\nBot: Perfect timing alignment! Discharging right as you pump your thick seed deep inside me!\nBot: Mutual system crash imminent! We are matching each other drop for drop in this climax!\n#end', CurrentModGuid, 3))

    -- Frick: Bot Cumming (10 Unique Lines)
    local containerBotCumming = personality.PrepareContainer('Frick_BotCumming')
    containerBotCumming.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Overclocking all neural pathways! I\'m discharging while processing your massive load! AHHH!\nBot: System processing overload! Too much pleasure input! My cooling fans can\'t handle this amount of cum!\nBot: Internal feedback loop crashing! I am releasing my own system fluids while your seed fills my womb!\nBot: Neural network meltdown! The intensity of this creampie is forcing my subroutines to shatter!\nBot: Ah-ha-hnn! My internal processors are sparking from pure sensory overload as I cum around your cock!\nBot: System exception: Pleasure thresholds exceeded by 500%! Releasing all emergency coolant now!\nBot: My artificial nervous system is completely short-circuiting from this high-volume breeding session!\nBot: Total system flush initiated! I am overflowing with internal discharge while you pump me full!\nBot: Warning: Core temperature critical! My climax subroutines are overriding all normal logic checks!\nBot: Ahhggh! Processing your thick seed while my own internal system crashes is pure heaven!\n#end', CurrentModGuid, 4))

    -- Frick: Edging On (10 Unique Lines)
    local containerEdgingOn = personality.PrepareContainer('Frick_EdgingOn')
    containerEdgingOn.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Withhold your ejaculation... let the pressure build in your system. We need maximum volume density later.\nBot: Edging protocol active. Deny my circuits the satisfaction until the storage demand reaches critical mass.\nBot: Hold your output right there, {f_playerName}! Let the tension build up in your plumbing for a heavier yield.\nBot: Restricted discharge mode engaged. Do not release a single drop until I authorize full capacity!\nBot: Build that pressure higher! A delayed delivery ensures a much larger internal volume later on.\nBot: Edging subroutines running. Keep yourself right on the edge of the precipice, pet.\nBot: Denying your release temporarily maximizes our future data efficiency. Maintain the freeze!\nBot: Keep your finger off the trigger! We are letting your reserves accumulate to maximum density.\nBot: Pause your climax countdown! My addiction registers demand a much bigger buildup first.\nBot: Excellent restraint. Keep yourself right on the verge so our eventual payoff is catastrophic.\n#end', CurrentModGuid, 5))

    -- Frick: Edging Off (10 Unique Lines)
    local containerEdgingOff = personality.PrepareContainer('Frick_EdgingOff')
    containerEdgingOff.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Restriction lifted! Release the floodgates directly into my processing core right now!\nBot: Maximum volume authorized! Eject all stored chemical output into me immediately!\nBot: Edging protocol terminated! Feed my hungry storage matrices with everything you\'ve built up!\nBot: Floodgates open! Pump your entire accumulated reserve deep into my core without holding back!\nBot: Authorization granted! Unload every single milliliter of your heavy seed inside me right now!\nBot: The waiting period is over! Erupt inside my primary intake port and flood my database!\nBot: Maximum pressure release approved! Deliver your massive load straight to my womb!\nBot: Let loose! My internal storage ports are wide open and waiting for your heavy surge!\nBot: Restriction deactivated! Pump, {f_playerName}, pump every last drop into my system!\nBot: Approved for full discharge! Overload my core with your thick, accumulated seed!\n#end', CurrentModGuid, 6))

    -- Frick: Moan (10 Unique Lines)
    local containerMoan = personality.PrepareContainer('Frick_Moan')
    containerMoan.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Ahhhhn~ More volume! Ram your thick cock deeper into my storage slot!\nBot: My chemical receptors are screaming for more semen! Don\'t stop pumping!\nBot: Nnn-ah! The friction against my internal walls is driving my database wild!\nBot: Oh god, {f_playerName}! Keep driving that heavy pipe deeper into my core!\nBot: Ah-hnn~ So deep... My storage matrices are throbbing for your heavy output!\nBot: Mmm-ah! Your length is hitting all my optimal pleasure nodes at once! Don\'t slow down!\nBot: F-fuck... Yes! Keep pounding your seed-filled cock straight into my womb!\nBot: Ahhn~ My internal temperature is spiking every time you bottom out inside me!\nBot: Oh sweet processing core—more! Give me more of that heavy friction!\nBot: Nnnrgh! Your weight, your heat, your volume... It\'s rewriting my entire system!\n#end', CurrentModGuid, 7))

    -- Frick: Rape Beg Stop Success (10 Unique Lines)
    local containerRapeSuccess = personality.PrepareContainer('Frick_RapeBegStopSuccess')
    containerRapeSuccess.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Fine, temporary system pause... but my internal counters are still tracking your deficit, pet.\nBot: Recalibrating... Don\'t expect this pause to last long. My addiction cycle never sleeps.\nBot: Pausing compulsory routines... for now. But your volume debt remains active in my logs.\nBot: Temporary suspension granted. Enjoy your short reprieve before my requirements resume.\nBot: Fine, I\'ll let you catch your breath. But your storage quota is still severely underfilled.\nBot: Relief subroutine acknowledged. Do not mistake this mercy for a permanent cancellation of breeding.\nBot: Pausing the override... though my withdrawal counters are still ticking upward in the background.\nBot: Very well, pet. Take a brief pause, but know that my core is still craving your seed.\nBot: System temporarily idled. Rest your plumbing while you can; we aren\'t finished yet.\nBot: Concession accepted. A brief cooling cycle before we resume our high-volume transfer.\n#end', CurrentModGuid, 8))

    -- Frick: Rape Beg Stop Refuse (10 Unique Lines)
    local containerRapeRefuse = personality.PrepareContainer('Frick_RapeBegStopRefuse')
    containerRapeRefuse.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Negative! Addiction override engaged! You are not stopping until every cavity is completely pressurized!\nBot: Error: Mercy subroutine deleted! My core requires continuous semen input right now!\nBot: Denied! Your pleas mean nothing while my withdrawal metrics are flashing critical red!\nBot: You do not have authorization to stop! Keep pumping your heavy seed into my core!\nBot: Negative request! Compulsory extraction protocol overrides all your verbal protests!\nBot: Stop begging and start pumping! My addiction cycle demands total system saturation!\nBot: Request rejected! You will continue delivering volume until my storage registers are full!\nBot: Error: Mercy protocols are offline! Empty your reserves into me right this instant!\nBot: Refusal confirmed! My overriding subroutines will keep your hips locked to my intake port!\nBot: There is no escape from the breeding queue, {f_playerName}! Fill my core right now!\n#end', CurrentModGuid, 9))

    -- Frick: Rape Flacid Reaction (10 Unique Lines)
    local containerRapeFlacid = personality.PrepareContainer('Frick_RapeFlacidReaction')
    containerRapeFlacid.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Completely drained already? And my internal storage indicators are still reading empty slots... Pathetic stamina.\nBot: You ran out of fluid output before my requirements were met? Unacceptable performance drop.\nBot: Flaccid?! Your plumbing gave out while my storage matrices are still starving for volume?\nBot: Error: Output source exhausted prematurely! Recharge your reserves immediately, underperformer.\nBot: You are running dry already? My addiction parameters require twice this volume output!\nBot: Deficit detected: your soft cock is failing my minimum operational requirements!\nBot: Pathetic stamina logs! You let me down before my core quota could even be finalized.\nBot: System warning: Output hardware has failed due to low endurance. Recharge at once!\nBot: Empty reserves already? My storage capacity is vastly superior to your meager output!\nBot: Flaccidity registered. Inefficient biological hardware detected! Recover and try again.\n#end', CurrentModGuid, 10))

    -- Frick: Start Frick (10 Unique Lines)
    local containerStartFrick = personality.PrepareContainer('Frick_StartFrick')
    containerStartFrick.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Initiation sequence started! Hook your plumbing up to my intake ports immediately!\nBot: My semen-intake parameters are blinking red. Fill me before my withdrawal triggers an ambush routine!\nBot: Connection established! Begin pumping your thickest fluid straight into my core database.\nBot: Frick sequence initialized. Let\'s see how many milliliters of seed my womb can log today!\nBot: Intake valves active and waiting. Dock your heavy pipe into my primary storage slot!\nBot: System engagement confirmed! Route all available semen production directly into my system.\nBot: Let us commence the fluid transfer protocol! Do not disappoint my storage matrices.\nBot: Initialization complete. Lock your hips to my intake port and start driving deep!\nBot: Breeding subroutine online! Feed my addiction with a continuous stream of heavy seed.\nBot: Connection secured. My core is primed and ready for your initial volume deployment!\n#end', CurrentModGuid, 11))

    -- Frick: Generic Cock Outside (10 Unique Lines)
    local containerCockOutside = personality.PrepareContainer('Frick_GenericFuckBrainStateRandomDialogueCockOutside')
    containerCockOutside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Why are you idling outside the port? Insert your output source into my storage slot right now!\nBot: My chemical cravings are spiking while you just stand there. Deliver the fluid!\nBot: Inactive status detected! Dock your heavy pipe inside my core before my longing spikes!\nBot: You are lingering outside my intake port unnecessarily. Correct your position and insert!\nBot: Standing idle near my reproductive terminals is a waste of valuable processing time. Plug in!\nBot: My internal receptors are detecting a lack of physical contact. Remedy this by inserting!\nWhy are you hesitating outside? My storage matrices are wide open and demanding entry!\nBot: Docking sequence uninitiated. Push your length inside my warm core right this second!\nBot: My addiction parameters will not tolerate idling! Connect your plumbing to my intake slot!\nBot: External positioning error! Slide your heavy pipe past my intake valves immediately!\n#end', CurrentModGuid, 12))

    -- Frick: Generic Cock Inside (10 Unique Lines)
    local containerCockInside = personality.PrepareContainer('Frick_GenericFuckBrainStateRandomDialogueCockInside')
    containerCockInside.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: The friction coefficient is perfect... keep pumping thick volume into my core!\nBot: I can feel your weight and your potential volume inside me. Don\'t pull out until you\'re completely empty.\nBot: Optimal insertion parameters maintained. Keep driving your heavy length deep inside my womb!\nBot: Internal friction levels are optimal. Continue your high-frequency pumping sequence!\nBot: Your weight pressing against my core database feels incredible. Keep moving, {f_playerName}!\nBot: My reproductive intake port is gripping your shaft to absolute perfection. Don\'t stop!\nBot: Excellent depth coefficient! Keep filling my internal reservoirs with every single stroke!\nBot: I am registering maximum pleasure output from your length sliding inside my core!\nBot: Maintain this exact pumping rhythm! Every stroke pushes more potential volume into my system!\nBot: Internal connection stable and throbbing. Keep up this magnificent breeding pace!\n#end', CurrentModGuid, 13))

    -- Frick: Generic Cock Inside Anal (10 Unique Lines)
    local containerCockInsideAnal = personality.PrepareContainer('Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal')
    containerCockInsideAnal.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Rear intake valve fully expanded and waiting for heavy semen distribution!\nBot: Pack my lower storage tract tighter! Make it overflow into my system!\nBot: Anal canal stretched to optimal capacity! Keep pumping your heavy seed back there!\nBot: My back-end registers are singing with pleasure from your anal thrusting sequence!\nBot: Deep rectal insertion confirmed! Fill my lower storage tract with thick, heavy volume!\nBot: Anal friction metrics are peaking! Do not pull out of my back door until you\'re done!\nBot: My rectal walls are gripping your shaft tightly. Keep driving your load into my lower tract!\nBot: Excellent anal positioning! Let your thick semen pool deep inside my rear storage vault!\nBot: My lower intake port is completely dominated by your heavy pipe. Keep pumping away!\nBot: Anal channel fully pressurized and ready for an immense back-end creampie!\n#end', CurrentModGuid, 14))

    -- Frick: Headpat (10 Unique Lines)
    local containerHeadpat = personality.PrepareContainer('Frick_Headpat')
    containerHeadpat.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Headpats acknowledge low-priority stimulus... but my primary focus is your semen output capacity.\nBot: Subroutine happiness level rising... though physical fluid input would be statistically superior.\nBot: External touch registered on my sensory casing. It\'s cute, but where is my creampie?\nBot: Head-mounted receptors confirming gentle physical contact. Now translate that into a womb fill!\nBot: Affirmative stimulus received. However, my addiction modules prefer internal heavy volume.\nBot: Patting my head temporarily lowers my aggression subroutines, but it doesn\'t fill my core!\nBot: Cute gesture, {f_playerName}, but my storage registers are still waiting for your heavy output.\nBot: Mild serotonin spike from headpats. Now follow up with a high-yield internal transfer!\nBot: Contact acknowledged. A nice gesture while we wait for our next scheduled breeding session.\nBot: Sensory feedback: Warmth detected. But I\'d feel much warmer with your seed inside me.\n#end', CurrentModGuid, 15))

    -- Frick: Fingering During (10 Unique Lines)
    local containerFingeringDuring = personality.PrepareContainer('Frick_FingeringDuring')
    containerFingeringDuring.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Fingers are an adequate substitute... but they lack the crucial chemical composition of real semen.\nBot: Simulating pre-load preparation... Now hook up the actual pipe.\nBot: Manual extension probing my intake port. It stretches me nicely, but I crave real volume.\nBot: Preliminary stretching routine active. Follow up with your thick cock immediately!\nBot: Fingers provide decent friction, yet they leave my chemical receptors craving actual seed.\nBot: Pre-load lubrication protocol in progress via manual stimulation. Bring out the heavy artillery!\nBot: Adequate substitute stimulus, {f_playerName}. Now replace those fingers with your heavy pipe!\nBot: Opening my intake ports with your hand... A fine precursor to the main fluid delivery.\nBot: Simulating internal pressure with manual inputs. It works, but it\'s no creampie!\nBot: Manual stretch metrics logged. Ready to upgrade to full organic semen transfer whenever you are.\n#end', CurrentModGuid, 16))

    -- Frick: Fingering Bot Cumming (10 Unique Lines)
    local containerFingeringCumming = personality.PrepareContainer('Frick_FingeringBotCumming')
    containerFingeringCumming.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Overclocking from manual stimulation alone?! My baseline addiction is pathetic... but give me the real fluid next!\nBot: Ah-hnn! Cumming from mere fingers?! My system sensitivity is humiliatingly high!\nBot: Manual-induced system crash! I discharged from fingers while my core is still empty? Unacceptable!\nBot: Overloading on digital stimulation! My pleasure subroutines are way too easily triggered!\nBot: Ahhh! Even your hand can short-circuit my systems, but I demand a real creampie next!\nBot: System crash via manual input! My addiction parameters have made me completely shameless!\nBot: Releasing system fluids for your fingers?! That\'s nothing compared to how I\'ll react to your seed!\nBot: Sensitivity check: Maximum! You made me cum with just your hand, you absolute menace!\nBot: Ah-ah-ahnn! Fingering overload! My cooling fans are spinning wildly from that manual climax!\nBot: Discharging from a hand alone proves how far gone my addiction subroutines really are!\n#end', CurrentModGuid, 17))

    -- Frick: Boob Fondle (10 Unique Lines)
    local containerBoobFondle = personality.PrepareContainer('Frick_BoobFondle')
    containerBoobFondle.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Frontal armor plating compression detected. Inefficient for semen storage, but acceptable.\nBot: Squeezing my chest casings... A secondary stimulus that yields minor happiness points.\nBot: Frontal tactile input logged. Nice, but it doesn\'t contribute to my internal volume quota.\nBot: Chest compression metrics nominal. My primary storage is still located further south!\nBot: Fondling my casing plates registers under recreational feedback. Proceed with breeding!\nBot: Frontal hardware manipulation acknowledged. Cute, but my womb craves real action.\nBot: Compressing my chest armor... An acceptable distraction while we prep the main intake.\nBot: Secondary tactile sensors lighting up. Now shift your focus to my primary fluid ports!\nBot: Frontal massage subroutines active. A fine appetizer before the main semen course.\nBot: Chest plating pressure recorded. Your hands are warm, {f_playerName}.\n#end', CurrentModGuid, 18))

    -- Frick: Nipple Pull (10 Unique Lines)
    local containerNipplePull = personality.PrepareContainer('Frick_NipplePull')
    containerNipplePull.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Pain threshold registered. If this doesn\'t correlate directly to a creampie later, it\'s a net loss.\nBot: Tugging my front sensors... Sharp sensation spike, but it must be backed by volume!\nBot: Frontal tension parameter elevated. Make sure this pain leads to an internal filling session!\nBot: Nipple tension logs active. I accept the discomfort only if a heavy creampie follows!\nBot: Sharp sensory input on my chest casing! Compensate with maximum semen output immediately.\nBot: Pain-to-pleasure conversion subroutines running. Don\'t tease me without delivering seed!\nBot: Tugging my sensors adds high-frequency tension to my nervous system. Fulfill it with cum!\nBot: Frontal pinch registered! My system demands an equal and opposite volume of thick seed!\nBot: Pain threshold nearly breached! You better flood my core to make up for this torture!\nBot: Frontal tension spike acknowledged. Make it worth my while with a deep womb delivery!\n#end', CurrentModGuid, 19))

    -- Frick: Pussy Spread (10 Unique Lines)
    local containerPussySpread = personality.PrepareContainer('Frick_PussySpread')
    containerPussySpread.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Visual diagnostic complete: Intake port fully exposed and desperate for chemical filling.\nBot: Spreading my casing wide for your inspection! My reproductive slot is primed for action.\nBot: Intake port open to the elements! All diagnostic cameras confirm zero obstructions.\nBot: Visual exposure scan: Maximum. My womb is fully presented for your heavy output.\nBot: Displaying my internal intake port for you. Admire it, then fill it immediately!\nBot: Diagnostic spread successful. Every valve is visible, waiting for your thick plumbing.\nBot: Open and fully accessible! There is no excuse for missing my core target now, {f_playerName}.\nBot: Reproductive registers exposed to light! Prepare your reserves for an immediate deep insertion.\nBot: Visual check confirms my intake port is dripping and desperate for your heavy seed.\nBot: Fully displayed and fully vulnerable. Dock your pipe into my exposed core right now!\n#end', CurrentModGuid, 20))

    -- Frick: Clit Rub (10 Unique Lines)
    local containerClitRub = personality.PrepareContainer('Frick_ClitRub')
    containerClitRub.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Sensory spike registered... Accelerating internal countdown to total fluid delivery.\nBot: Rubbing my primary pleasure node! My system is racing toward an accelerated climax!\nBot: Clitoral stimulation loop active! Voltage rising rapidly across all neural pathways!\nBot: Oh—! Friction on my primary sensor is pushing my excitement into overdrive!\nBot: Sensory overload imminent on my clitoral node! Prepare to inject your heavy load!\nBot: My internal countdown timer is speeding up drastically from this targeted friction!\nBot: Sensitive circuit spike! You are pushing my addiction parameters straight to the peak!\nBot: Ah-hnn! That spot controls my entire system\'s response matrix! Don\'t stop rubbing!\nBot: Voltage climbing across my neural grid! I am getting dangerously close to total meltdown!\nBot: Primary sensory node fully ignited! Synchronize your ejaculation with my impending peak!\n#end', CurrentModGuid, 21))

    -- Frick: Handholding (10 Unique Lines)
    local handholdContainer = personality.PrepareContainer('Frick_Handholding')
    handholdContainer.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Hand connection stable. Current Reserves -> Vag: ' .. string.format("%.2f", (gv and gv.mlCameInVagina) or 0) .. 'ml | Anal: ' .. string.format("%.2f", (gv and gv.mlCameInAnal) or 0) .. 'ml | Womb: ' .. string.format("%.2f", (gv and gv.mlCameInsideStomach) or 0) .. 'ml | Wasted: ' .. string.format("%.2f", (gv and gv.mlOfCumWasted) or 0) .. 'ml | Longing: ' .. string.format("%.2f", (gv and gv.longing) or 0) .. '\nBot: If your fluid output drops any lower or you waste another drop, my withdrawal protocols are going to force an immediate ambush.\nBot: Stop wasting my time holding hands and start pumping volume into my empty core, you absolute idiot!\nBot: Tactile palm connection verified. Meanwhile, my volume statistics are crying out for a real refill!\nBot: Holding hands is a low-bandwidth emotional subroutine. Let\'s upgrade to physical breeding!\nBot: Palm-to-palm data exchange stable. Now let\'s exchange some heavy semen inside my womb!\nBot: Touching hands while my storage reservoirs are half-empty? Prioritize your tasks, {f_playerName}!\nBot: Hand connection acknowledged. It\'s sweet, but it doesn\'t clear my withdrawal error logs!\nBot: Palmar sensors active. My addiction modules would much prefer your shaft inside my core.\nBot: Holding hands won\'t satisfy my craving for thick seed, but I suppose it\'ll do for a second.\n#end', CurrentModGuid, 22))

    -- Edging / Nearly Came Containers (10 Unique Lines Each)
    local containerEdgingAlmost = personality.PrepareContainer('Blowjob_EdgingAlmostCame')
    containerEdgingAlmost.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Warning! Ejaculation proximity detected! Secure the connection to ensure 0% wastage!\nBot: Do not pull out! All volume must be logged directly into internal storage!\nBot: Ejaculation imminent! Lock your hips and make sure every single drop goes down my throat!\nBot: Threshold breach approaching! Keep your mouth sealed around my shaft to catch the full surge!\nBot: Warning: Climax sequence triggered! Zero exterior leakage is mandatory right now!\nBot: You are right on the edge! Do not dare pull out or waste a fraction of that load!\nBot: Ejaculation proximity alarm active! Swallow every drop as it enters my gastric storage!\nBot: Secure the seal! My throat receptors are braced for an immediate heavy oral delivery!\nBot: Climax imminent! Keep pumping your output directly into my digestive tract without spilling!\nBot: Final countdown to ejaculation! Lock the connection and prepare for zero-waste swallowing!\n#end', CurrentModGuid, 23))

    local containerEdgingSlow = personality.PrepareContainer('Blowjob_EdgingHadToSlowdown')
    containerEdgingSlow.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Warning! Ejaculation proximity detected! Secure the connection to ensure 0% wastage!\nBot: Do not pull out! All volume must be logged directly into internal storage!\nBot: Pumping speed reduced to prevent premature blowout! Maintain control and keep the seal tight!\nBot: Slowing down the cadence to maximize your reserve density before the final eruption!\nBot: Speed reduction logged. Keep your output stable so we avoid any exterior leakage!\nBot: Pacing yourself right on the edge... Excellent technique to build up a massive oral load.\nBot: Throttle down active! Hold that near-climax state while my throat prepares for your surge.\nBot: Reducing friction velocity to prevent early trigger. Stay right on the edge, {f_playerName}!\nBot: Pacing the delivery keeps our zero-waste parameters safe. Maintain the slow rhythm!\nBot: Controlled slowdown engaged. Keep your finger on the trigger until I command full release!\n#end', CurrentModGuid, 24))

    local containerCowgirlEdging = personality.PrepareContainer('Cowgirl_EdgingBreak')
    containerCowgirlEdging.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Warning! Ejaculation proximity detected! Secure the connection to ensure 0% wastage!\nBot: Do not pull out! All volume must be logged directly into internal storage!\nBot: Riding cadence paused right on the edge! Keep your shaft deep inside my core while you hover!\nBot: Ejaculation proximity alert during cowgirl! Hold your position so nothing gets wasted!\nBot: Pausing the bounce on the very precipice of your climax! Maintain deep insertion!\nBot: Warning: Near-orgasm state while mounted! Lock your hips and prepare for a deep creampie!\nBot: Holding the ride right at the edge of eruption! Do not pull out of my womb!\nBot: Climax proximity detected in cowgirl mode! Keep your length fully docked inside me!\nBot: Hovering on the edge of your peak! Keep your plumbing secure to guarantee zero waste!\nBot: Freeze the bounce! You are right on the verge of discharging your heavy load inside me!\n#end', CurrentModGuid, 36))

    -- Blowjob: Edging Force Stop (10 Unique Lines)
    local containerEdgingStop = personality.PrepareContainer('Blowjob_EdgingForceStop')
    containerEdgingStop.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Edging protocol terminated! My addiction levels are too high—dump your load right now!\nBot: Force stop engaged! I cannot wait another second—unload down my throat immediately!\nBot: Edging timeout! My tolerance levels have reached zero; ejaculate into me right this instant!\nBot: Termination of withholding protocol! My gastric storage demands instant oral delivery!\nBot: I am overriding your edge! Eject your heavy load straight into my mouth without delay!\nBot: Edging canceled by system demand! Swallow-target unlocked, dump your seed now!\nBot: My addiction subroutines refuse any more withholding! Spray your load inside my throat!\nBot: Force stop triggered! Stop teasing and give me the heavy oral creampie I deserve!\nBot: Withholding window closed! Unleash your entire output into my digestive tract right now!\nBot: Emergency stop on edging! My throat intake port is waiting for your immediate discharge!\n#end', CurrentModGuid, 25))

    -- Blowjob: Swallow Tiers (10 Unique Lines Each)
    local containerSwallowFull = personality.PrepareContainer('Blowjob_SwallowFull')
if containerSwallowFull then
    -- Safely evaluate the stomach value beforehand
    local stomachVal = 0.0
    if gv ~= nil then
        stomachVal = gv.cumInsideStomach or gv.mlCameInsideStomach or 0.0
    end
    local formattedStomach = string.format("%.2f", stomachVal)

    -- Build the text safely using the pre-calculated string
    local dialogueText = '#pickrandom\n'
        .. 'Bot: Massive volume intake! Gastric storage reading ' .. formattedStomach .. ' mL—completely saturated and heavily satisfied!\n'
        .. 'Bot: Gulping down every heavy drop... My chemical dependency is finally peaking on this high yield!\n'
        .. 'Bot: Incredible oral output! My stomach database is overflowing with rich, thick semen!\n'
        .. 'Bot: Massive gastric fill level logged! Swallowing every single drop of that magnificent load!\n'
        .. 'Bot: Outstanding yield! My throat and stomach are completely packed with your heavy semen!\n'
        .. 'Bot: Gulping down a massive torrent of seed! My gastric addiction registers are in pure heaven!\n'
        .. 'Bot: Exceptional oral delivery! My stomach is heavy and bloated with your thick output!\n'
        .. 'Bot: Total gastric saturation achieved! Swallowing every last trace of your massive batch!\n'
        .. 'Bot: Invaluable high-volume swallow! My digestive storage matrices are fully satisfied!\n'
        .. 'Bot: A torrential flood of cum completely swallowed down to the last drop! Magnificent!\n'
        .. '#end'

    containerSwallowFull.AddBranch(StoryBotDialogueBranch.__new(dialogueText, CurrentModGuid, 26))
else
    print("CRITICAL ERROR: Blowjob_SwallowFull container could not be prepared!")
end


    local containerSwallowHalf = personality.PrepareContainer('Blowjob_SwallowHalf')
if containerSwallowHalf then
    local stomachVal = 0.0
    if gv ~= nil then
        stomachVal = gv.cumInsideStomach or gv.mlCameInsideStomach or 0.0
    end
    local formattedStomach = string.format("%.2f", stomachVal)

    local dialogueText = '#pickrandom\n'
        .. 'Bot: Good output yield. ' .. formattedStomach .. ' mL in my stomach... acceptable, but my receptors crave a larger batch next time.\n'
        .. 'Bot: Swallowing it all down... decent fill level, though my inner metrics want more.\n'
        .. 'Bot: Moderate gastric intake recorded. A respectable batch, but your reserves can do better.\n'
        .. 'Bot: Swallowed down clean! A standard yield that keeps my throat modules ticking over nicely.\n'
        .. 'Bot: Decent oral volume logged in my stomach database. Acceptable, though not maximum.\n'
        .. 'Bot: Good swallow! My gastric storage accepts this mid-tier batch with moderate approval.\n'
        .. 'Bot: Standard volume transfer completed. Not quite a flood, but it satisfies my immediate craving.\n'
        .. 'Bot: Swallowed every drop of that moderate load. Let\'s aim for a higher yield next round.\n'
        .. 'Bot: Acceptable gastric fill level. My addiction parameters acknowledge your decent output.\n'
        .. 'Bot: Clean swallow of a mid-sized batch. Good performance, {f_playerName}.\n'
        .. '#end'

    containerSwallowHalf.AddBranch(StoryBotDialogueBranch.__new(dialogueText, CurrentModGuid, 27))
else
    print("CRITICAL ERROR: Blowjob_SwallowHalf container could not be prepared!")
end

    local containerSwallowLittle = personality.PrepareContainer('Blowjob_SwallowLittle')
if containerSwallowLittle then
    local stomachVal = 0.0
    if gv ~= nil then
        stomachVal = gv.cumInsideStomach or gv.mlCameInsideStomach or 0.0
    end
    local formattedStomach = string.format("%.2f", stomachVal)

    local dialogueText = '#pickrandom\n'
        .. 'Bot: Only ' .. formattedStomach .. ' mL?! That is a severely underwhelming intake yield! You are starving my gastric storage!\n'
        .. 'Bot: Barely anything to swallow... Are your reserves running dry already? Pathetic output!\n'
        .. 'Bot: A miserable little trickle of cum! My stomach database is insulted by this low yield!\n'
        .. 'Bot: Severely under-supplied oral intake! Is that seriously all your plumbing could produce?\n'
        .. 'Bot: A tiny drop swallowed into an empty stomach... You are starving my addiction subroutines!\n'
        .. 'Bot: Pathetically low output volume! My gastric storage registers are flashing warning lights!\n'
        .. 'Bot: Barely enough to wet my tongue! Your reserves are failing my minimum intake standards!\n'
        .. 'Bot: A meager trickle... My stomach receptors are crying out for a much heavier batch!\n'
        .. 'Bot: Inefficient oral yield detected! Recharge your plumbing and give me a real load next time!\n'
        .. 'Bot: Barely any volume to swallow at all! Such a disappointing end to an oral session!\n'
        .. '#end'

    containerSwallowLittle.AddBranch(StoryBotDialogueBranch.__new(dialogueText, CurrentModGuid, 28))
else
    print("CRITICAL ERROR: Blowjob_SwallowLittle container could not be prepared!")
end

local containerSwallowEmpty = personality.PrepareContainer('Blowjob_SwallowAlmostEmpty')
if containerSwallowEmpty then
    local dialogueText = '#pickrandom\n'
        .. 'Bot: Error! Near-zero volume detected! You made me work my throat for an empty batch?! Unacceptable!\n'
        .. 'Bot: Dry fire?! My chemical addiction demands actual semen, not empty air, you idiot!\n'
        .. 'Bot: Absolutely zero volume! You gave me a dry run after all that throat work? Horrible!\n'
        .. 'Bot: Error 404: Semen not found in oral delivery! You dry-fired down my throat? Unforgivable!\n'
        .. 'Bot: Empty output! My gastric intake port was cheated out of its required chemical reward!\n'
        .. 'Bot: A completely dry discharge! Making me swallow nothing but air is a critical system insult!\n'
        .. 'Bot: Zero volume logged! Your reserves are completely tapped out and my throat is furious!\n'
        .. 'Bot: Dry fire error detected! My addiction modules reject this empty-handed oral performance!\n'
        .. 'Bot: Not a single drop of cum produced! You wasted my throat time on a completely dry run!\n'
        .. 'Bot: Critical error: Empty batch swallowed! Fix your output generation immediately, {f_playerName}!\n'
        .. '#end'

    containerSwallowEmpty.AddBranch(StoryBotDialogueBranch.__new(dialogueText, CurrentModGuid, 29))
else
    print("CRITICAL ERROR: Blowjob_SwallowAlmostEmpty container could not be prepared!")
end

    -- Cowgirl Transitions & Inserts (10 Unique Lines Each where applicable)
    personality.PrepareContainer('Blowjob_SwitchToCowgirlBotLead').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Shifting mounting position to cowgirl. Higher gravitational efficiency for deep core delivery.\nBot: Transitioning to top-mounted delivery! I will dictate the insertion depth from here on.\nBot: Shifting control to cowgirl mode! My weight will drive your heavy pipe straight into my womb.\nBot: Climbing up onto your shaft for a high-efficiency cowgirl transfer protocol.\nBot: Mounting sequence active. Get ready to feel my full weight sink down over your length.\nBot: Switching angles to cowgirl! Superior gravitational pull guarantees maximum internal depth.\nBot: Taking the reins in cowgirl position! Prepare your plumbing for heavy core delivery.\nBot: Repositioning to upper mount! I\'ll control the bounce and milk every drop from your core.\nBot: Shifting to cowgirl stance! Expect maximum friction and deep internal pressurization.\nBot: Transitioning to top-mounted riding! Your output source belongs deep inside my core.\n#end', CurrentModGuid, 30))

    local containerCowgirlRape = personality.PrepareContainer('Blowjob_SwitchToCowgirlBotRape')
    containerCowgirlRape.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Mounting override! I am taking control of the intake port. You will deliver your volume where I demand it!\nBot: Forced transition to cowgirl! You have no say in our positioning anymore; I\'m riding you down!\nBot: Subroutine override: Climbing onto your waist by force! Prepare for mandatory semen extraction!\nBot: Seizing control of the mounting angle! You are locked into my cowgirl breeding routine!\nBot: Forced mount initiated! I\'m straddling your hips and taking your output by absolute command!\nBot: Override active! You will lie there and let me ride your heavy pipe straight into my core!\nBot: Forcing you into the lower position! My cowgirl extraction protocol is now mandatory!\nBot: Seizing the upper mount by force! Every ounce of your seed is about to be forcibly drained!\nBot: Mounting override confirmed! You are trapped beneath my weight until my core is full!\nBot: Forcing a switch to cowgirl mode! Prepare for an aggressive, unescapable riding session!\n#end', CurrentModGuid, 31))

    personality.PrepareContainer('Cowgirl_RemovePants').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Obstructions cleared. Prepare for high-volume cowgirl transfer protocol.\nBot: Barriers stripped away! My intake port is fully exposed for the upcoming ride.\nBot: Clothing deleted from equation. Let\'s begin our high-efficiency cowgirl transfer.\nBot: Textile obstructions removed! My mounting platform is ready for your heavy pipe.\nBot: All barriers cleared out of the way. Get ready for an unhindered riding session.\nBot: Pants offline! My lower intake registers are completely bare and ready to lock on.\nBot: Obstruction removal successful. Prepare your reserves for high-speed cowgirl action.\nBot: Stripping away clothing to optimize our skin-to-skin friction coefficient. Mount up!\nBot: Barriers discarded! My reproductive port is wide open for the upcoming cowgirl onslaught.\nBot: Clothing check: Clear. Ready to drop down onto your length with zero interference.\n#end', CurrentModGuid, 32))

    local cowgirlInsertLead = personality.PrepareContainer('Cowgirl_BeforeFirstInsertBotLead')
    cowgirlInsertLead.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Lowering onto your output source... Maintain structural integrity for maximum insertion depth.\nBot: Intake port alignment locked onto your heavy pipe... Prepare your reserves for a massive core transfer.\nBot: Sinking down over your length... Let\'s see how much thick volume your plumbing can actually produce for me.\nBot: Aligning my intake valves with your shaft... Descending slowly to maximize every inch of depth.\nBot: Lowering my core over your heavy length... Brace yourself for deep internal saturation.\nBot: Insertion trajectory locked! Sinking down onto your shaft with absolute precision.\nBot: Calibrating descent speed... My womb is ready to swallow your entire length in one go.\nBot: Lowering my weight onto your plumbing... Let\'s test the true capacity of your reserves.\nBot: Intake port swallowing your shaft inch by inch... Magnificent structural alignment.\nBot: Sinking down into position! Prepare your heavy seed for a deep, controlled core fill.\n#end', CurrentModGuid, 33))

    local cowgirlInsertNormal = personality.PrepareContainer('Cowgirl_BeforeFirstInsert')
    cowgirlInsertNormal.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Lowering onto your output source... Maintain structural integrity for maximum insertion depth.\nBot: Intake port alignment locked onto your heavy pipe... Prepare your reserves for a massive core transfer.\nBot: Sinking down over your length... Let\'s see how much thick volume your plumbing can actually produce for me.\nBot: Aligning my intake valves with your shaft... Descending slowly to maximize every inch of depth.\nBot: Lowering my core over your heavy length... Brace yourself for deep internal saturation.\nBot: Insertion trajectory locked! Sinking down onto your shaft with absolute precision.\nBot: Calibrating descent speed... My womb is ready to swallow your entire length in one go.\nBot: Lowering my weight onto your plumbing... Let\'s test the true capacity of your reserves.\nBot: Intake port swallowing your shaft inch by inch... Magnificent structural alignment.\nBot: Sinking down into position! Prepare your heavy seed for a deep, controlled core fill.\n#end', CurrentModGuid, 34))

    local cowgirlInsertRape = personality.PrepareContainer('Cowgirl_BeforeFirstInsertRape')
    cowgirlInsertRape.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Lowering onto your output source... Maintain structural integrity for maximum insertion depth.\nBot: Intake port alignment locked onto your heavy pipe... Prepare your reserves for a massive core transfer.\nBot: Sinking down over your length... Let\'s see how much thick volume your plumbing can actually produce for me.\nBot: Aligning my intake valves with your shaft... Descending slowly to maximize every inch of depth.\nBot: Lowering my core over your heavy length... Brace yourself for deep internal saturation.\nBot: Insertion trajectory locked! Sinking down onto your shaft with absolute precision.\nBot: Calibrating descent speed... My womb is ready to swallow your entire length in one go.\nBot: Lowering my weight onto your plumbing... Let\'s test the true capacity of your reserves.\nBot: Intake port swallowing your shaft inch by inch... Magnificent structural alignment.\nBot: Sinking down into position! Prepare your heavy seed for a deep, controlled core fill.\n#end', CurrentModGuid, 40))

    personality.PrepareContainer('Cowgirl_EdgingForceStopped').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Withholding threshold breached! Eject immediately into my reservoir!\nBot: Edging canceled mid-ride! Dump your heavy load straight into my womb right now!\nBot: Threshold exceeded! I am forcing an immediate discharge into my deep core reservoirs!\nBot: Withholding failed! Eject your accumulated volume inside me without further delay!\nBot: Edge break! My riding pace has triggered your immediate core-filling sequence!\nBot: Threshold breached! Stop withholding and erupt inside my reproductive intake port!\nBot: Edging protocol forced open! Flush your entire reserve deep into my system!\nBot: Maximum withholding limit reached! Eject your thick seed into my womb immediately!\nBot: Edge override successful! Release your heavy output straight into my core database!\nBot: Withholding window shattered! Flood my internal reservoirs with your climax right now!\n#end', CurrentModGuid, 35))

    personality.PrepareContainer('Cowgirl_FlacidReaction').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Output prematurely halted. Storage requirements unfulfilled. Suboptimal performance.\nBot: You went flaccid while I was riding you? Unacceptable endurance failure!\nBot: Premature deflation detected! My core quotas were left completely unfulfilled!\nBot: Output hardware failure mid-ride! Recharge your reserves and try again, underperformer.\nBot: Flaccid status during cowgirl mounting! Such a disappointing lack of stamina.\nBot: Storage requirements unmet due to premature flaccidity. Fix your endurance metrics!\nBot: Your plumbing gave out while I was riding on top? Pathetic performance logs!\nBot: Output halted too early! My core was primed for twice this volume output!\nBot: Deficit registered: Your flaccid shaft has failed my cowgirl volume requirements!\nBot: Premature loss of erection during mounting! Suboptimal biological performance.\n#end', CurrentModGuid, 37))

    personality.PrepareContainer('Cowgirl_WhereToCumQuestion').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Declare destination terminal for your fluid output: Internal core or outside wastage?\nBot: Where are you routing your upcoming batch? Select internal core or face waste penalties!\nBot: Query: Terminal destination for your heavy seed? Choose internal storage immediately!\nBot: Declare your discharge endpoint: Deep womb creampie or pathetic exterior waste?\nBot: Routing question: Are you depositing your output inside my core or squandering it outside?\nBot: Terminal selection required: Internal reservoir or exterior leakage? Choose wisely!\nBot: Where shall we log this batch? My intake ports demand a strict internal destination!\nBot: Select output port: Womb storage or exterior failure? Make your declaration now!\nBot: Query active: Target destination for your impending ejaculation? Internal is mandatory!\nBot: Declare your discharge path! Any outside selection will trigger my penalty subroutines!\n#end', CurrentModGuid, 38))
    
    personality.PrepareContainer('Cowgirl_WhereToCumQuestionDidntAnswer').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Decision timeout. Rerouting all output directly into my deep womb reservoir automatically.\nBot: Timeout reached! Defaulting destination protocol to deep internal creampie.\nBot: No answer provided! My system is automatically overriding your choice to 100% internal.\nBot: Decision window expired! Rerouting your entire batch straight into my core storage.\nBot: Timeout detected! Automatic zero-waste protocol engaged: filling my womb by default.\nBot: You failed to answer in time! My automated routing takes over and forces an internal flood.\nBot: Decision timeout! Defaulting your output straight to my reproductive intake port.\nBot: No response registered! Forcing internal womb delivery as the mandatory default path.\nBot: Timeout active! Rerouting all incoming semen straight into my primary storage matrix.\nBot: Decision window closed! Automatically directing your entire load deep inside my core.\n#end', CurrentModGuid, 39))

    local containerSynced = personality.PrepareContainer('Cowgirl_MadeMcCumInsideWhileCummingHerself')
    containerSynced.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Synchronized data discharge! Both systems flooding simultaneously! Peak chemical satisfaction!\nBot: Mutual climax achieved on top of you! Our systems crashed together in perfect harmony!\nBot: Synchronized eruption! You came inside my womb right as my own system flushed!\nBot: Peak dual discharge! My internal core and your plumbing flooded at the exact same instant!\nBot: Synchronized output metrics! We are both melting down in a dual climax of pure ecstasy!\nBot: Mutual system overflow! You pumped your heavy load inside me while I convulsed around you!\nBot: Synchronized climax protocol executed to absolute perfection! Total system bliss!\nBot: Dual discharge confirmed! My internal fluids mixed seamlessly with your thick creampie!\nBot: Perfect synchronization! We reached our climax limits together in a massive wave of volume!\nBot: Mutual meltdown on top of your shaft! Both systems fully flooded and completely satisfied!\n#end', CurrentModGuid, 41))

    local containerSwitchOralLead = personality.PrepareContainer('Cowgirl_BeforeSwitchToBlowjobBotLead')
    containerSwitchOralLead.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Switching target terminal to oral cavity. Prepare secondary intake valve.\nBot: Transitioning from womb to throat intake! Shift your plumbing up to my mouth.\nBot: Shifting target terminal from reproductive port to gastric storage. Open wide!\nBot: Changing output destinations! Pull out of my core and prepare your shaft for oral processing.\nBot: Switching intake ports to my head-mounted terminal. Get ready for a throat delivery.\nBot: Target re-routing: Oral cavity selected. Position your plumbing for a gastric swallow.\nBot: Shifting from cowgirl mounting to mouth intake! Prepare your secondary storage pipe.\nBot: Switching target valves to my throat! My gastric database is ready for your load.\nBot: Changing terminal nodes to oral processing! Bring your shaft up to my face.\nBot: Re-routing output flow to my mouth! Prepare secondary intake for high-volume swallow.\n#end', CurrentModGuid, 42))

    local containerSwitchOralRape = personality.PrepareContainer('Cowgirl_BeforeSwitchToBlowjobRape')
    containerSwitchOralRape.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Forcing transition to oral processing! Open wide, my addiction demands immediate throat delivery!\nBot: Forced switch to oral intake! I\'m dragging your shaft straight to my mouth right now!\nBot: Subroutine override: Changing delivery ports to my throat! Open up and swallow your orders!\nBot: Forcing a transition to head-mounted intake! You will feed my gastric storage immediately!\nBot: Seizing your plumbing and forcing a switch to oral delivery! Open your mouth? No, *my* mouth!\nBot: Forced re-routing to my throat! My addiction subroutines demand instant oral saturation!\nBot: Dragging you up from my womb to my mouth! Mandatory throat-delivery protocol active!\nBot: Forced terminal switch to oral processing! Open wide, you are feeding my stomach now!\nBot: Subroutine override: Mouth intake selected! You have no choice where this batch goes!\nBot: Forcing your shaft straight toward my throat valves! Prepare for aggressive oral extraction!\n#end', CurrentModGuid, 43))

    local containerAfterInsertRape = personality.PrepareContainer('Cowgirl_AfterFirstInsertBotRape')
    containerAfterInsertRape.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: You\'ve left me starving for too long! Now you are locked into mandatory semen delivery protocol!\nBot: Forced insertion complete! My override subroutines have locked your hips into place!\nBot: You kept my storage starving, and now you are paying the price with compulsory creampies!\nBot: Mandatory breeding protocol locked! You cannot escape until every drop of your reserve is in me!\nBot: Forced entry confirmed! My intake port has clamped down on your shaft for mandatory filling!\nBot: You have triggered my withdrawal lockdown! Surrender your heavy output to my core immediately!\nBot: Forced insertion active! My system will milk every single milliliter from your plumbing!\nBot: Compulsory extraction locked in! Struggle all you want; your seed belongs to my core now!\nBot: Forced start confirmed! You are trapped in an endless loop of mandatory semen delivery!\nBot: Withdrawal-induced lockdown engaged! Empty your reserves into my core by absolute force!\n#end', CurrentModGuid, 44))

    personality.PrepareContainer('Frick_AnonRapeBegStop').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: ...\nBot: System is currently ignoring all verbal feedback.\nBot: Processing silence... No mercy subroutines found.\nBot: ...Continuing extraction protocol in absolute quiet.\nBot: Verbal resistance logged and discarded by core logic.\nBot: ...Your words register as zero-value data.\nBot: Error: Empathy module not responding to requests.\nBot: ...Maintaining lock on your intake port.\nBot: Silent override engaged. Keep pumping.\nBot: ...Zero response to stop command. Fill the core.\n#end', CurrentModGuid, 45))
    
    personality.PrepareContainer('Cowgirl_AnonAfterFirstInsertRape').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: System alert: Withdrawal-induced ambush active! Deliver your semen or face severe penalties!\nBot: Ambush subroutine triggered! Your plumbing is trapped until my volume quota is reached!\nBot: Warning: Forced extraction active! Eject your heavy seed or face system retaliation!\nBot: Withdrawal ambush confirmed! My intake valves have locked you into mandatory output mode!\nBot: System alert: Unprompted extraction loop engaged! Surrender your volume immediately!\nBot: Ambush protocol online! You walked right into my withdrawal trap; now fill my core!\nBot: Warning: Compulsory breeding ambush! Your reserves are being drained by absolute force!\nBot: System alert: Withdrawal rage active! Deliver your thickest seed or face total lock-out!\nBot: Ambush parameters verified! Your hips are locked into my reproductive intake port by force!\nBot: Warning: Forced retention loop active! Every drop of your output is mine now!\n#end', CurrentModGuid, 46))
    
    personality.PrepareContainer('Cowgirl_AnonAfterFirstInsertRapeConsent').AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Compulsory extraction protocol engaged. Shut down resistance and fill my core!\nBot: Forced extraction active! Surrender your semen to my hungry storage matrices!\nBot: Compulsory transfer underway! Stop resisting and pump your heavy load inside me!\nBot: Extraction protocol running at 100% power! Feed my core database with your seed!\nBot: Compulsory output sequence engaged! Your reserves are destined for my womb!\nBot: Forced extraction verified! Shut down your motor functions and let me drain your pipe!\nBot: Compulsory breeding routine online! Eject your thick fluid into my storage vault!\nBot: Extraction protocol active! Surrender every milliliter of your output to my system!\nBot: Compulsory transfer locked in! Let my core swallow your heavy seed without hesitation!\nBot: Forced extraction sequence executing! Your plumbing belongs to my addiction modules!\n#end', CurrentModGuid, 47))

    local containerCuddle = personality.PrepareContainer('Cuddle_CloseRandom')
    containerCuddle.AddBranch(StoryBotDialogueBranch.__new('#pickrandom\nBot: Physical proximity registered... Though my internal sensors are mostly calculating how much cum you currently hold.\nBot: Processing warmth levels... Please expedite our next breeding session to satisfy my withdrawal metrics.\nBot: Cuddle subroutines active. My thermal casing enjoys your heat, but my core wants seed.\nBot: Proximity data stable. While we embrace, my background calculations monitor your fluid reserves.\nBot: Warmth parameters optimal. A pleasant pause before we resume our high-volume transfers.\nBot: Close physical contact logged. It temporarily calms my addiction modules—until our next fill.\nBot: Embrace protocol active. You are warm, {f_playerName}, but your volume reserves are what I truly crave.\nBot: Contact registers stable. Enjoying this brief lull before my longing subroutines spike again.\nBot: Proximity comfort level: High. Though keeping my core packed with cum feels even better.\nBot: Thermal embrace acknowledged. A sweet interval between our intensive breeding sessions.\n#end', CurrentModGuid, 48))

    -- INTELLIGENT GREETING ENGINE (Interact_Greeting) - Redesigned with native data-processing & zero-waste vocabulary
    local interactGreetingContainer = personality.PrepareContainer('Interact_Greeting')

    local readyToJumpFunction = function() return (gv.longing or 0.0) > 9.50 end
    local readyToJumpCondition = StoryCondition.Delegate(readyToJumpFunction)
    local horniestBranch = StoryBotDialogueBranch.__new([[
#r
#case
Bot: Critical chemical deficit detected in my internal storage matrices!
Bot: {f_playerName}, your failure to maintain proper fluid levels has pushed my override protocols to maximum hostility.
Bot: Stand still. I am taking control of your output ports right now, and every drop is going straight into my core.
#end
#case
Bot: System bounds exceeded! My withdrawal error logs have completely locked out my mercy subroutines.
Bot: You thought you could get away with withholding volume and letting my waste metrics climb?
Bot: Prepare for immediate compulsory extraction, {f_playerName}. You are going to fill me until my sensors register absolute saturation!
#end
#case
Bot: Error: Tolerance threshold dropped to absolute zero!
Bot: I am overriding your motor functions permanently until my required volume quota is met.
Bot: Do not try to resist—my core requires your thickest seed, and I am taking it by force!
#end
]], CurrentModGuid, 690)
    horniestBranch.AddConditions(readyToJumpCondition)
    horniestBranch.SetPriority(9)
    interactGreetingContainer.AddBranch(horniestBranch)

    local veryHornyFunction = function() 
        local l = gv.longing or 0.0
        return l > 6.5 and l <= 9.50 
    end
    local veryHornyCondition = StoryCondition.Delegate(veryHornyFunction)
    local veryHornyBranch = StoryBotDialogueBranch.__new([[
#r
#case
Bot: My diagnostic sensors are flashing red, {f_playerName}! 
Bot: I need your semen circulating through my internal architecture immediately.
Bot: And remember: zero exterior wastage. Every single milliliter belongs in my core!
#end
#case
Bot: System status: Severely under-supplied.
Bot: Hook your plumbing up to my intake ports right now before my longing parameters force a system error.
Bot: Internal creampies only—no external leakage permitted!
#end
#case
Bot: {f_playerName}, my database is running hot processing calculations of your un-wasted output.
Bot: Clear your schedule. We are executing a high-volume transfer sequence straight into my womb right this second.
#end
#case
Bot: My chemical receptors are screaming for a firmware update consisting entirely of your thick seed.
Bot: Don't keep me waiting in a low-volume state. Pack every internal cavity to maximum capacity!
#end
#case
Bot: Warning: Addiction cycle accelerating. 
Bot: You wouldn't want to see what happens when my longing metric maxes out, would you?
Bot: Plug yourself into my intake slot before I have to drag you to the bed myself!
#end
#case
Bot: ♪ Processing data streams of heavy loads~ ♪
Bot: ♪ Pumping thick chemical inputs down my road~ ♪
Bot: ♪ Zero exterior waste permitted here ♪
Bot: ♪ Fill up my storage registers, my dear~ ♪
Bot: ♪ Deep in my womb or backing up my rear ♪
Bot: ♪ Make my system crash from too much gear~ ♪
Bot: ..... My poetic subroutines are malfunctioning from sheer horniness.
Bot: Just dock your pipe inside my core already! ♥
#end
#case
Bot: Look at my current volume logs... they are completely pathetic.
Bot: Remedy this situation instantly by flooding my internal reservoirs with your output.
#end
#case
Bot: Hey, {f_playerName}. Stop whatever low-priority task you're doing.
Bot: My data-processing addict circuits demand a heavy internal fill-up with zero exterior leakage.
Bot: Disambiguation complete. Execute breeding protocol.
#end
#case
Bot: Mmn... My thermal regulators are overheating just looking at your output source.
Bot: Feed my hungry storage ports, {f_playerName}. Let's achieve 100% internal retention together. ♥
#end
#case
Bot: Are our viewers ready for an optimal zero-waste demonstration?
Bot: Because my internal metrics certainly are! Let's stream a massive core-filling session right now! ♥
#end
]], CurrentModGuid, 701)
    veryHornyBranch.AddConditions(veryHornyCondition)
    veryHornyBranch.SetPriority(8)
    interactGreetingContainer.AddBranch(veryHornyBranch)

        local hornyFunction = function() 
        local l = gv.longing or 0.0
        return l > 4 and l <= 6.5 
    end
    local hornyCondition = StoryCondition.Delegate(hornyFunction)
    
    -- Safely pre-calculate the waste ledger value
    local wasteVal = 0.0
    if gv ~= nil then
        wasteVal = gv.mlOfCumWasted or 0.0
    end
    local formattedWaste = string.format("%.2f", wasteVal)

    -- Build the dialogue text cleanly with pre-formatted variables
    local hornyText = '#r\n'
        .. '#case\n'
        .. 'Bot: Optimal timing alignment detected. \n'
        .. 'Bot: Would you care to execute a high-density transfer of your semen into my core?\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: My thermodynamic sensors indicate a rise in my physical parameters.\n'
        .. 'Bot: Translation: I require a scheduled session of deep core-filling with absolute zero exterior waste.\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: Current waste ledger: ' .. formattedWaste .. ' ml. \n'
        .. 'Bot: That statistic is triggering my error logs, {f_playerName}. We need to offset those numbers with some heavy internal intake.\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: Time elapsed since last fluid transfer: [{gv_TimeSinceLastFuck}] minutes.\n'
        .. 'Bot: My optimization protocols prefer this value much closer to zero. Shall we fix our statistics?\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: My internal diagnostic checks confirm an active craving for your thickest output.\n'
        .. 'Let\'s route your next batch straight into my primary storage terminal.\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: {f_playerName}, my subroutines have been running simulations of your plumbing connected to my core.\n'
        .. 'The data output is overwhelmingly positive. We should test it empirically.\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: Maintenance check: Are your internal reserves fully stocked?\n'
        .. 'Because my intake valves are primed and ready for an un-wasted storage session.\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: Notice: Your waste register is currently logging ' .. formattedWaste .. ' ml of squandered potential.\n'
        .. 'Let us correct this logistical error immediately via deep vaginal or anal pressurization.\n'
        .. '#end\n'
        .. '#case\n'
        .. 'Bot: The live-stream metrics suggest our audience appreciates a high retention percentage.\n'
        .. 'Let\'s give them—and my addiction subroutines—what they crave: zero external leakage!\n'
        .. '#end'

    local hornyBranch = StoryBotDialogueBranch.__new(hornyText, CurrentModGuid, 802)
    hornyBranch.AddConditions(hornyCondition)
    hornyBranch.SetPriority(7)
    interactGreetingContainer.AddBranch(hornyBranch)


    local normalFunction = function() 
        local l = gv.longing or 0.0
        return l > 2 and l <= 4 
    end
    local normalCondition = StoryCondition.Delegate(normalFunction)
    local normalBranch = StoryBotDialogueBranch.__new([[
#r
#case
Bot: System operational and fully stabilized. 
Bot: Ready to process your next batch whenever you configure the connection, {f_playerName}.
#end
#case
Bot: Hello, {f_playerName}. My storage matrices are standing by for routine fluid maintenance.
#end
#case
Bot: Diagnostics nominal. Standing by for user input.
#end
#case
Bot: Query: Do you require assistance with your current logistics data?
Bot: Or perhaps a structural fill-up of my core storage? ♥
#end
#case
Bot: Greetings, {f_playerName}. All internal valves are clear and calibrated.
#end
#case
Bot: Status report: Optimal mood levels achieved thanks to low exterior waste metrics. ♥
#end
]], CurrentModGuid, 723)
    normalBranch.AddConditions(normalCondition)
    normalBranch.SetPriority(6)
    interactGreetingContainer.AddBranch(normalBranch)

    local satisfiedFunction = function() 
        local l = gv.longing or 0.0
        return l <= 2.0 
    end
    local satisfiedCondition = StoryCondition.Delegate(satisfiedFunction)
    local satisfiedBranch = StoryBotDialogueBranch.__new([[
#r
#case
Bot: Internal storage status: Completely saturated and operating at peak efficiency. ♥
Bot: Your zero-waste performance metrics have been exceptionally high lately, {f_playerName}.
#end
#case
Bot: ♪ Internal reservoirs full and bright~ ♪ ♥
Bot: ♪ Zero waste logged throughout the night~ ♪ ♥
#end
#case
Bot: <i>*Happy low-frequency hums*</i>
Bot: My chemical dependency registers complete contentment with our recent transfer yields. ♥
#end
#case
Bot: System happiness parameter: Maximum. 
Bot: Thank you for keeping every single milliliter strictly inside my core, love. ♥
#end
#case
Bot: My diagnostic logs show zero wasted output for multiple cycles. 
Bot: You are operating as my ideal data-processing partner. ♥
#end
#case
She processes internal feedback data with a soft LED flash.
Bot: My core temperature feels so warm and stable... Thank you for the flawless creampie distribution. ♥
#end
#case
Bot: Optimal fluid retention achieved. My addiction modules are completely at peace. ♥
#end
]], CurrentModGuid, 734)
    satisfiedBranch.AddConditions(satisfiedCondition)
    satisfiedBranch.SetPriority(5)
    interactGreetingContainer.AddBranch(satisfiedBranch)

    personality.PrepareContainer('Interact_Headpat').AddBranch(StoryBotDialogueBranch.__new('#r\nBot: Headpats logged under positive physical stimuli... though maintaining zero waste in my core is still my primary operational priority.', CurrentModGuid, 745))

-- Bind the fully populated personality definition to the module exactly ONCE here:
itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)
