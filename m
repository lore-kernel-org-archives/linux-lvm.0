Subject: Re: [linux-lvm] Automatic snapshot system?
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu>
	<20011129004736.A14092@auctionwatch.com>
	<ufa667ts3zh.fsf@epithumia.math.uh.edu>
	<20011129130007.F20807@auctionwatch.com>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Petro's message of "Thu, 29 Nov 2001 13:00:07 -0800"
Message-ID: <ufa1yihs2cc.fsf@epithumia.math.uh.edu>
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
Date: Thu Nov 29 15:16:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "p" == petro  <petro@auctionwatch.com> writes:

p> Well, I won't get into the debate on whether it's better to
p> protect the users or educate them (ie easy to access backups make
p> users sloppy kind of argument),

Uh, well, I've been an administrator for 13 years and a computer user
for 24, and I still accidentally overwrite a file or delete a
directory on occasion.  And when this happens, I don't particularly
want to have to mess with the tape drive.  The the LVM system already
includes a method for making snapshots; why not make use of it?
Educating users doesn't really come into it.

p> Establish a cron-job to run at <work-start-time>, <work-start+4>
p> and <work-end>. This cron job calls a script that expires the old
p> snap and creates a new one.

Well, I understand how to do it.  I was simply asking if anyone had
already done it so I can save myself some work.  (It's actually mildly
complicated.  You have to parse various /proc files to get the LVM
state and figure out which snapshots you have active and whether any
of them have filled and thus become unusable.  You also have to update
/etc/fstab so a reboot doesn't lose your snapshots.)

 - J<
