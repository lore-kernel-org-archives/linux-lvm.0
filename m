From: Melinda Taylor <melinda@phys.unsw.edu.au>
Message-id: <5.1.1.6.0.20030712160456.02b2e398@imap.phys.unsw.edu.au>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] LVM disk died
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
Date: Sat Jul 12 22:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I was searching through the LVM mailing list archives and someone said:

 > I read the FAQs and one of them shows how to recover from a dead drive. It
 > is says you lose the data in the Logical Volume but I'm hoping just the
 > data on the physical disk that died and not the entire volume. Yep, as 
explained above

can someone direct me to the faq that shows me how to recover from a dead 
drive.

I had LVM spanning 4 HDDs and one will no longer spin up. That was also the 
disk housing the / filesystem. The / filesystem was not LVM but ext3 but 
there was an LVM partition on there. I have backups, thank god but they a 
couple of days old.

I have to reinstall the Operating system (redhat 7.3) from scratch, if I 
install as I did before, will I be able to recover the data on the 
remaining 3 disks? A friend said it should be as easy as a couple of 
commands but I am still such a newbie to LVM and this is the first time, 
since installing it I have had to think about it again.

Any tips anyone can offer would be appreciated or directions to the faq 
mentioned above. I searched the sistina site but to no avail.

Many Thanks,

Melinda
