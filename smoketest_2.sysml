package ReqDefVsUsage_Smoketest {
    public import ScalarValues::**;

   // ---------- Requirement DEFINITIONS (semantic types) ----------
   requirement def FunctionalRequirement {
      // Avoid enum literals; keep it scalar for maximum tool compatibility
      attribute level : ScalarValues::Integer;
      
      attribute verifyMethod : ScalarValues::String;
      attribute whyText : ScalarValues::String;
   }

   requirement def VehicleGoal :> FunctionalRequirement;

   requirement def VehicleStartup :> VehicleGoal {
      attribute maxStartupTime_s : ScalarValues::Real;
   }

   // ---------- Minimal architecture ----------
   part def Vehicle;
   part def EngineSystem;
   part def PowertrainECU;

   part vehicle : Vehicle;
   part engine  : EngineSystem;
   part ecuPT   : PowertrainECU;

   // ---------- Requirement USAGES (context + allocation) ----------
   requirement goal_startup : VehicleGoal {
      attribute :>> level = 0;
      attribute :>> verifyMethod = "Analysis";
      attribute :>> whyText = "Vehicle shall be startable for basic usability.";
      subject vehicle;
   }

   requirement rs_startup_engine : VehicleStartup {
      attribute :>> level = 1;
      attribute :>> maxStartupTime_s = 2.0;
      attribute :>> verifyMethod = "Test";
      attribute :>> whyText = "Engine system shall stabilize quickly after start request.";
      subject engine;
   }

   requirement rs_startup_ecu : VehicleStartup {
      attribute :>> level = 1;
      attribute :>> maxStartupTime_s = 0.3;
      attribute :>> verifyMethod = "Test";
      attribute :>> whyText = "Powertrain ECU startup sequence shall complete within budget.";
      subject ecuPT;
   }
}