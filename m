From: <acpretty@ozemail.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20021211053254.IDFV22279.mta06.mail.mel.aone.net.au@[127.0.0.1]>
Subject: [linux-lvm] LVM is wont restore. DESPERATE. PLEASE HELP!
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Dec 10 23:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hey all, 
  If someone is around who could help me it would be SO appreciated. 

I have a volume group (vg00) with two physical volumes in it.     

with in about half an hour .....
   I extended one of the logical volumes, no probs
   I extended the file system, noprobs 
   was doing a large-ish transfer to my enlarged fs when the machine crashed...

upon restarting the machine told me I had inconsistencies in my PV's so I did a vgcfgrestore. Now upon restarting I get no acknowledgement of the volume group at all....

SO! I thought I'd try and force a vgimport of the volume group only to find that vgimport says that the two PV's in the VG are not from the same VG. 

now I'm a bit lost, if anyone could help, PLEASE!!!! I have one last thing I think I should try but I'm uncertain. 

When I run pvdata the bit at the bottom says:

  --- List of physical volume UUIDs ---

  001: EtJbdT-qZBP-P6Bf-yRwi-I4Bn-0qzS-L13XYu
  002: --- EMPTY ---

shouldn't each PV know about all the other PV's UUID's in this list and therefore can anyone tell me if using the UUID fixer program is the thing to do?

more importantly can anyone tell me how much of the partitions I need to dd in order to preserve the meta data in case this doesn't help

Thanks reading this far and thanks in advance to the help
Alex

This message was sent through MyMail http://www.mymail.com.au
