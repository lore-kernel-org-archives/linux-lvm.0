From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] HELP: vgscan segfaults
Message-ID: <20030129160958.GG802@tykepenguin.com>
References: <20030129151209.GB2200@elrond.lohmann-services.de> <20030129151819.GE802@tykepenguin.com> <20030129153229.GC2200@elrond.lohmann-services.de> <20030129154207.GF802@tykepenguin.com> <20030129155936.GA2428@elrond.lohmann-services.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030129155936.GA2428@elrond.lohmann-services.de>
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
Date: Wed Jan 29 10:10:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 29, 2003 at 04:59:36PM +0100, Peter Lohmann wrote:
> > 
> > If your metadata backups are up-to-date then "vgchange -ay" should activate the
> > volumes regardless. Something must have changed, programs don't just work one
> > day and segv the next without good reason.
> 
> I know... but still:
> 
> --> vgchange -ay myvg
> vgchange -- volume group "myvg" does not exist
> 
> Same with vgchange -ay
> 
> :-(

Looks like the segfaulting vgscan started to write the metadata backups. See of
you can find valid ones in /etc/lvmtab and restore them using vgcfgrestore.

OR it might be as easy as creating a new /etc/lvmtab with "myvg\0" in it and
retrying vgchange.
-- 

patrick
