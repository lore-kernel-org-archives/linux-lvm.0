Subject: Re: [linux-lvm] determining lv from mount point 
In-Reply-To: Your message of "Tue, 23 Sep 2003 16:33:46 CDT."
             <2D4B6CD74137D4119A1100104BC6BCBF0BC585CF@dubntex006.qwest.net> 
From: Galen Seitz <galens@seitzassoc.com>
Message-Id: <20030923215218.4E43E8F03@tinman.seitzassoc.com>
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
Date: Tue Sep 23 16:53:01 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Montgomery, Kendal L <kendal.montgomery@qwest.com> wrote:

> Well.. The reason I say to do it this way is because lvdisplay doesn't
> seem to give an "error" code on return (it's always 0) when it's not a
> logical volume.  It does display an error message that you'd have to
> parse the output for a specific error message.

I just tried lvdisplay, and now I see what you mean.  I misinterpreted
the lvdisplay man page, thinking I'd get an error on non-lvm paths.

Thanks very much for your help.

galen
