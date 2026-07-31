package com.devops.project;

import org.junit.Test;
import static org.junit.Assert.assertTrue;

public class AppTest {
    
    @Test
    public void testQualityGate() {
        // We will change this to 'false' to simulate a broken build
        assertTrue("Pipeline quality gate test", false); 
    }
}