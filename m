Message-ID: <3E95220A.ABEF64D5@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] extending LVM for school project
References: <001301c2fe5c$95d38970$02fea8c0@nimiak>
Content-Transfer-Encoding: 7bit
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
Date: Thu Apr 10 02:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Kai-Min Sung wrote:
> 
> Hey everyone,
>         I'm a masters student taking a distributed systems project class
> and would like to work on extending LVM. My initial idea was to modify
> LVM and allow it to create physical volumes using disks on remote nodes.
> But then I read posts about using ENBD to achieve this. Do people on
> this list have suggestions or ideas for a fun/interesting project that
> could be accomplished within 10 weeks?

I have the same plans, though it is a linuxkernel course. My plan was to
make a combination of LVM2 and PPDD (encryption). The idea was to make 
LVM support encrypted LV's that would need to be unlocked before usage,
in order to make blockencryption easier. 

LVM ontop of loopback encryption wont work, as i then need to encrypt
the
hole LVM, and some files are not sensitive.

loopback encryption ontop of LVM wont work, as the live snapshot feature
then doesnt work.

I had the idea to make it possible to encrypt the LE (Logical Extends)
so
that the LV was encrypted, because it would seem the most aprociate
place.
(i havent actualy read the LVM code yet, just the documentation and just
for LVM1.)



JonB
