From: "Fred Dinkler" <netbeast2001@hotmail.com>
Mime-Version: 1.0
Message-ID: <F118msINIyzaH8uOvtq00006fc6@hotmail.com>
Subject: [linux-lvm] vgexport interupted
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
Date: Fri Jul 26 22:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

     I have a 150 Gig LVM array. I was in the process of getting ready to 
upgrade from Slack 8.0 to 8.1. I started vgexport on the vg "archive", but 
before it finished, the power blinked and my UPS didnt catch it in time. The 
server rebooted. All LVM tools, including uufix, now think that they are 2 
diffrent incomplete VGs, one exported and one " associated to an unknown 
VG". How do I remedy this? Following are the output of some LVM progs.

         I apreciate any help,
          Fred Dinkler IV


pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdk1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hdl1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hdi1"  is in EXPORTED VG "archive" [28.62 GB / 0 
free]
pvscan -- inactive PV "/dev/hdj1"  is in EXPORTED VG "archive" [37.29 GB / 0 
free]
pvscan -- inactive PV "/dev/hde1"  is associated to an unknown VG (run 
vgscan)
pvscan -- total: 5 [149.79 GB] / in use: 5 [149.79 GB] / in no VG: 0 [0]

vgexport archive
vgexport -- volume group "archive" doesn't exist

vgimport archive /dev/hdk1 /dev/hdl1 /dev/hdi1 /dev/hdj1 /dev/hde1
vgimport -- ERROR: physical volume "/dev/hdk1" doesn't belong to an exported 
volume group

./uuid_fixer /dev/hdk1 /dev/hdl1 /dev/hdi1 /dev/hdj1 /dev/hde1   Error: PV 
/dev/hdi1 does not belong to /dev/hdk1's VG


_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx
