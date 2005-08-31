Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VMoUV09153
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 18:50:30 -0400
Received: from smtp.aaisp.net.uk (B.painless.aaisp.net.uk [81.187.81.52])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7VMoA6I031119
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 18:50:15 -0400
Received: from ebourne.me.uk ([81.187.210.78] helo=hordein.ebourne.me.uk)
	by smtp.aaisp.net.uk with esmtp (Exim 4.43) id 1EAbPF-0003aS-Km
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 23:50:09 +0100
Received: from avenin.ebourne.me.uk (avenin.ebourne.me.uk [192.168.66.4])
	by hordein.ebourne.me.uk (Postfix) with ESMTP id 2E16412CE5C
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:50:07 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by avenin.ebourne.me.uk (Postfix) with ESMTP id 17FD6C80F9
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:50:07 +0100 (BST)
Subject: Re: [linux-lvm] pvmove is stuck
From: Martin Ebourne <lists@ebourne.me.uk>
In-Reply-To: <20050831222947.GL15141@agk.surrey.redhat.com>
References: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
	<20050831213759.GI15141@agk.surrey.redhat.com>
	<1125525121.11068.12.camel@avenin.ebourne.me.uk>
	<20050831222947.GL15141@agk.surrey.redhat.com>
Content-Type: multipart/mixed; boundary="=-pDlzbdYUUCzT1w45vuS+"
Date: Wed, 31 Aug 2005 23:50:05 +0100
Message-Id: <1125528606.11068.23.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-pDlzbdYUUCzT1w45vuS+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2005-08-31 at 23:29 +0100, Alasdair G Kergon wrote:
> > vg_hordein-pvmove0: 377487360 209715200 mirror 2 3:1 22:64 204799/204800
> 
> Look at the last fraction saying how far it got: it suggests you got a 
> bad sector.  Check your system log to see if it reported this (and says 
> which sector).

Ok, everything you said makes sense thanks.

But is there any other possible explanation than a bad sector? Only
there's several reasons I don't think there are any bad sectors:

1. The source disk is < 4 months old (though that doesn't preclude
anything)

2. There's no sector errors in the syslog, and normally there would be.

3. SMART doesn't report any errors, and normally it would.
In particular I'd expect to see Offline_Uncorrectable != 0,
and Current_Pending_Sector != 0 too.
Also Raw_Read_Error_Rate != Hardware_ECC_Recovered.
And something in the error log.

In this case the smart output is 100% clean (attached just in case).
Note that I've got cron running a short test daily and an extended test
weekly. All clean too.

Cheers,

Martin.


--=-pDlzbdYUUCzT1w45vuS+
Content-Description: 
Content-Disposition: inline; filename=smart-hda.txt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

smartctl version 5.33 [x86_64-redhat-linux-gnu] Copyright (C) 2002-4 Bruce Allen
Home page is http://smartmontools.sourceforge.net/

=== START OF INFORMATION SECTION ===
Device Model:     ST3400832A
Serial Number:    3NF04XED
Firmware Version: 3.01
User Capacity:    400,088,457,216 bytes
Device is:        Not in smartctl database [for details use: -P showall]
ATA Version is:   7
ATA Standard is:  Exact ATA specification draft version not indicated
Local Time is:    Wed Aug 31 23:48:03 2005 BST
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x82)	Offline data collection activity
					was completed without error.
					Auto Offline Data Collection: Enabled.
Self-test execution status:      (   0)	The previous self-test routine completed
					without error or no self-test has ever 
					been run.
Total time to complete Offline 
data collection: 		 ( 430) seconds.
Offline data collection
capabilities: 			 (0x5b) SMART execute Offline immediate.
					Auto Offline data collection on/off support.
					Suspend Offline collection upon new
					command.
					Offline surface scan supported.
					Self-test supported.
					No Conveyance Self-test supported.
					Selective Self-test supported.
SMART capabilities:            (0x0003)	Saves SMART data before entering
					power-saving mode.
					Supports SMART auto save timer.
Error logging capability:        (0x01)	Error logging supported.
					General Purpose Logging supported.
Short self-test routine 
recommended polling time: 	 (   1) minutes.
Extended self-test routine
recommended polling time: 	 ( 134) minutes.

SMART Attributes Data Structure revision number: 10
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000f   048   046   006    Pre-fail  Always       -       98203519
  3 Spin_Up_Time            0x0003   097   097   000    Pre-fail  Always       -       0
  4 Start_Stop_Count        0x0032   100   100   020    Old_age   Always       -       10
  5 Reallocated_Sector_Ct   0x0033   100   100   036    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000f   084   066   030    Pre-fail  Always       -       284957913
  9 Power_On_Hours          0x0032   097   097   000    Old_age   Always       -       2665
 10 Spin_Retry_Count        0x0013   100   100   097    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   020    Old_age   Always       -       12
194 Temperature_Celsius     0x0022   043   056   000    Old_age   Always       -       43 (Lifetime Min/Max 0/21)
195 Hardware_ECC_Recovered  0x001a   048   046   000    Old_age   Always       -       98203519
197 Current_Pending_Sector  0x0012   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0010   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x003e   200   200   000    Old_age   Always       -       0
200 Multi_Zone_Error_Rate   0x0000   100   253   000    Old_age   Offline      -       0
202 TA_Increase_Count       0x0032   100   253   000    Old_age   Always       -       0

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%      2645         -
# 2  Short offline       Completed without error       00%      2621         -
# 3  Short offline       Completed without error       00%      2597         -
# 4  Extended offline    Completed without error       00%      2576         -
# 5  Short offline       Completed without error       00%      2552         -
# 6  Short offline       Completed without error       00%      2527         -
# 7  Short offline       Completed without error       00%      2504         -
# 8  Short offline       Completed without error       00%      2481         -
# 9  Short offline       Completed without error       00%      2456         -
#10  Short offline       Completed without error       00%      2433         -
#11  Extended offline    Completed without error       00%      2412         -
#12  Short offline       Completed without error       00%      2386         -
#13  Short offline       Completed without error       00%      2362         -
#14  Short offline       Completed without error       00%      2339         -
#15  Short offline       Completed without error       00%      2315         -
#16  Short offline       Completed without error       00%      2291         -
#17  Short offline       Completed without error       00%      2268         -
#18  Extended offline    Completed without error       00%      2246         -
#19  Short offline       Completed without error       00%      2220         -
#20  Short offline       Completed without error       00%      2196         -
#21  Short offline       Completed without error       00%      2173         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.


--=-pDlzbdYUUCzT1w45vuS+--
