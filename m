From: Turbo Fredriksson <turbo@bayour.com>
Message-ID: <87wv0lu1rw.fsf@papadoc.bayour.com>
MIME-Version: 1.0
Subject: [linux-lvm] LAZY MODE: Exchanging a LVM'ed disk
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
Date: Tue Nov 20 05:24:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I currently have a disk in my LVM set which is only 1Gb. It's also quite old,
so I'd like to replace that with a newer/bigger one..

How would I go about doing this?

        1. Add the new disk at the end of the LVM
        2. Extend the filesystem
        3. Move the data from the old disk to the new
        4. Remove the old disk

Is this about right? Or is there a simpler/faster way?

Bare in mind that all the SCSI id's will change when i remove the old disk,
will that complicate issues?

-- 
 Turbo     __ _     Debian GNU     Unix _IS_ user friendly - it's just 
 ^^^^^    / /(_)_ __  _   ___  __  selective about who its friends are 
         / / | | '_ \| | | \ \/ /    Debian Certified Linux Developer  
  _ /// / /__| | | | | |_| |>  <  Turbo Fredriksson   turbo@bayour.com
  \\\/  \____/_|_| |_|\__,_/_/\_\         Gothenburg/Sweden

domestic disruption ammonium Cocaine FSF quiche 747 FBI terrorist
Serbian smuggle Noriega Panama Treasury Qaddafi kibo
[See http://www.aclu.org/echelonwatch/index.html for more about this]
