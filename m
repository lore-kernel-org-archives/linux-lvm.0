Message-ID: <DFC80C4F8AE1D011A6560004ACECA354094D69BF@kmdx3.kmd.dk>
From: "Hansen,Ole OHA" <oha@kmd.dk>
Subject: RE: [linux-lvm] LVM/RAID or viceversa?
MIME-Version: 1.0
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
Date: Fri Dec  7 02:29:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi,

You can actually do it both ways; LVM on RAID and RAID with LVM :) The
problem with the latter is LVM for Linux does not yet support anything else
than striping. I have an installation running LVM on top of a mirrored md -
the Linux software raid; it works like a charm! :) 

--
Ole Hansen


-----Original Message-----
From: Peter Thalmann [mailto:peterth@gmx.net]
Sent: Friday, December 07, 2001 4:28 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] LVM/RAID or viceversa?


Hallo, 
I catched you on the ml, discussing on lvm and raid,so please explain me the
difference between raid on top of lvm and lvm on top of raid. Is it first
setting up the disk using raid tools and then configuring the lvm (lvm on
top of raid) or first setting up the drives using lvm and then setting up
the raid (raid on top of lvm) wich makes actually no sense to me because of
confusing the layers and making managemnet quite difficult. Am I wrong ?

Thanks, Peter

"a nice little guy from italy"
