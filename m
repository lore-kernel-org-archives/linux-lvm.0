From: "Carl Philip" <broix@hotmail.com>
Mime-Version: 1.0
Message-ID: <BAY1-F1131uWCsEFABf0004b5f1@hotmail.com>
Subject: [linux-lvm] trouble initiating the lvm after reinstall
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
Date: Fri May 30 19:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

4 PV(s) found for VG mylvm: expected 12
  Volume group "mylvm" not found

that's the error i get when i try to run lvs or when the system boots up.
all drives are connected just like before and i've reinstalled the system 
lots of times and it always works

i've changed mobo now tho to a one with an onboard highpoint 374 controller, 
but those drives get the sdX numbers assigned.

i have 4 drives on the mobo which it obviously finds, but those 8 on the 
promise ata 100 tx2 cards won't be 'found'. hde-hdl are there and it finds 
them all in the bootup and i can access them with cfdisk...i even tried to 
run ./MAKEDEV hde-hdl and mknod for hde-hdl...no difference :(

please please help me, i really need to get the lvm working cause i have 
files there i need

regards
/Carl Philip

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail
