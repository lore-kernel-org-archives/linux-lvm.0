Message-ID: <3DB54B99.15BF6280@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvdisplay -- logical volume 
 "/dev/optVG/1hour_snapshot_opt_1035237601"doesn't exist
References: <3DB53F96.BC133713@silicide.dk>
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
Date: Tue Oct 22 07:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jon Bendtsen wrote:
> 
> Cron Daemon wrote:
> >
> > lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035237601" doesn't exist

Sometimes i get a 
lvremove -- can't remove open snapshot logical volume
"/dev/optVG/1hour_snapshot_opt_1035266401"

from the hourly script. But it _IS_ unmounted.



JonB
