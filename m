Subject: Re: [linux-lvm] LAZY MODE: Exchanging a LVM'ed disk
References: <Pine.LNX.4.33.0111201025540.2520-100000@dragon.inside.ntisys.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <Pine.LNX.4.33.0111201025540.2520-100000@dragon.inside.ntisys.com>
Message-ID: <87r8qt78v4.fsf@papadoc.bayour.com>
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
Date: Tue Nov 20 09:39:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoting Benjamin Scott <bscott@ntisys.com>:

> On 20 Nov 2001, Turbo Fredriksson wrote:
> > I currently have a disk in my LVM set which is only 1Gb. It's also quite
> > old, so I'd like to replace that with a newer/bigger one..
> 
>   1. Backup the existing filesystem(s)
>   2. Verify the backup
>   3. Create a PV on the new disk (pvcreate)
>   4. Add the new PV to the existing VG (vgextend)
>   5. Move the data from the old PV to the new PV (pvmove)
>   6. Remove the old PV from the VG (vgreduce)
>   7. Extend the LV to use the entire new PV (lvextend)
>   8. Resize the filesystem to use the entire LV

Quoting Benjamin Scott <bscott@ntisys.com>:

> On 20 Nov 2001, Turbo Fredriksson wrote:
> > Do I _have_ to copy all the info to a empty disk, then create the lv
> > (pvcreate et al)?
> 
>  No, you could just blow away your existing non-LVM partition and lose all
> your data.  ;-)  But if you would like to *keep* your data, the answer is
> "Yes, you have to copy it all to another filesystem".

Dang! I was hopping I could get away easy here! :)

Thanx for the answer, I appreciate it, even though I don't "like it" if you know
what I mean :)

-- 
 Turbo     __ _     Debian GNU     Unix _IS_ user friendly - it's just 
 ^^^^^    / /(_)_ __  _   ___  __  selective about who its friends are 
         / / | | '_ \| | | \ \/ /    Debian Certified Linux Developer  
  _ /// / /__| | | | | |_| |>  <  Turbo Fredriksson   turbo@bayour.com
  \\\/  \____/_|_| |_|\__,_/_/\_\         Gothenburg/Sweden

plutonium NSA arrangements SEAL Team 6 toluene tritium
counter-intelligence pits 747 CIA Mossad Honduras munitions Saddam
Hussein colonel
[See http://www.aclu.org/echelonwatch/index.html for more about this]
