From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] All LV have the same content after repair attempt
Message-ID: <20030331003341.A4025@uk.sistina.com>
References: <200303310028.27139.daniel.heemann@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200303310028.27139.daniel.heemann@gmx.de>; from daniel.heemann@gmx.de on Sun, Mar 30, 2003 at 11:28:27PM +0100
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
Date: Sun Mar 30 17:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Mar 30, 2003 at 11:28:27PM +0100, Daniel Heemann wrote:
> b) the segment sections of the LV which used 
> the broken hdd did not contain an entry like 'pvX' inside 'stripes' but 
> 'Missing' was entered.
In future I want to replace 'Missing' with something that gives you
the PV's UUID, but some code restructuring is needed before I can make
that change.

I have also already added a command line switch '--removemissing' to 
vgreduce intended to automate the LVM2 side of the process.
People need to read the vgreduce man page before using this option.
e.g. To run it with '--test' before running it for real.

> I also tried to use vgscan and vgchange from the LVM2.1.95.15 package but it 
> fails to activate the vm, 
> But I think that's due to missing kernel/module support for lvm2.
Correct.  LVM2 needs device-mapper to activate the LVs.

Alasdair
-- 
agk@uk.sistina.com
