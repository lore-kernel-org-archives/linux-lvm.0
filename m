Message-ID: <3DB933C0.D4D5E357@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] still problems with removing "non existant" dead 
 snapshots :/
References: <3DB7C2FD.9C70E084@silicide.dk> <20021024132538.A30725@sistina.com>
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
Date: Fri Oct 25 07:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" wrote:
> 
> Jon,
> 
> which LVM version are you using?
> If the driver it is older than 1.0.5 it can be a lockking bug fixed in
> the recent LVM1 version.

I still get the error, i've got 3 this morning.

	umount: /dev/optVG/1hour_snapshot_opt_1035518401: not mounted
	lvremove -- ERROR "lv_release(): LV number" releasing logical volume
	"/dev/optVG/1hour_snapshot_opt_1035518401"

I'll use the -debug option and save the output.



JonB
