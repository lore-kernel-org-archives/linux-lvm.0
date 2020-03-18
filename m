References: <20200311182426.Horde.ihAVcWNsNhlTRdLvdCW3VA7@webmail.df.eu>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <a98340b3-2425-7cf6-6763-e37ffdc9151a@redhat.com>
Date: Wed, 18 Mar 2020 12:45:25 +0100
MIME-Version: 1.0
In-Reply-To: <20200311182426.Horde.ihAVcWNsNhlTRdLvdCW3VA7@webmail.df.eu>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] probable lvm thin_pool exhaustion
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, maiski@maiski.net

On 3/11/20 6:24 PM, maiski@maiski.net wrote:
> 
> Hello all,
> 
> i am a total newbie besides the general knowledge of lvm.
> With this disclaimer written I have the following problem,
> which may def need some expert knowledge of lvm, because i couldn't
> find solutions online for now :/
> 
> I am booting my system (in my case is Qubes, but I suppose that does not 
> matter at this point)
> and after entering my luks password get to the dracut emergency shell.
> "Check for pool qubes-dom/pool00 failed (status:1). Manual repair 
> required!"
> The only aclive lv is qubes_dom0/swap.
> All the others are inactive.
> 
> step 1:
> lvm vgscan vgchange -ay
> lvm lvconvert --repair qubes_dom0/pool00
> Result:
> using default stripesize 64.00 KiB.
> Terminate called after throwing an instance of 'std::runtime_error'
> what(): transaction_manager::new_block() couldn't allocate new block
> Child 7212 exited abnormally
> Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed 
> (status:1). Manual repair required!

One the first glance this looks like the problem reported in Bug 1763895 
- thin_restore fails with transaction_manager::new_block() couldn't 
allocate new block:

https://bugzilla.redhat.com/show_bug.cgi?id=1763895

> 
> step 2:
> since i suspect that my lvm is full (though it does mark 15 g as free)

IIUC it is the metada which is full, not the data.
What's the size of the below _tmeta volume?

What's `thin_check --version` and `lvm version` output?

-- Martian


> i tried the following changes in the /etc/lvm/lvm.conf
> thin_pool_autoextend_threshold = 80
> thin_pool_autoextend_percent = 2 (Since my the pvs output gives PSize: 
> 465.56g Pfree 15.78g, I set this to 2% to be overly cautious not to 
> extend beyond the 15 G marked as free, since idk)
> auto_activation_volume_list = to hold the group, root, pool00, swap and 
> a vm that would like to delete to free some space
> volume_list = the same as auto_activation_volume_list
> 
> and tried step 1 again, did not work, got the same result as above with 
> qubes_swap as active only
> 
> step 3 tried
> lvextend -L+1G qubes_dom0/pool00_tmeta
> Result:
> metadata reference count differ for block xxxxxx, expected 0, but got 1 ...
> Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!
> 
> 
> Since I do not know my way around lvm, what do you think, would be the 
> best way out of this?
> Adding another external PV? migrating to a bigger PV?
> I did not play with backup or achive out of fear to loose any unbackuped 
> data which happens to be a bit :|
> Any help will be highly appreciated!
> 
> Thanks in advance,
> m
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
