Date: Thu, 18 Oct 2001 08:42:19 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read_intr errors
Message-ID: <20011018084219.A564@tykepenguin.com>
References: <20011017152957.E644@tykepenguin.com> <000801c15747$7d86df10$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000801c15747$7d86df10$0300000a@pacbell.net>; from e@arix.com on Wed, Oct 17, 2001 at 01:08:30PM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 17, 2001 at 01:08:30PM -0700, Erick Calder wrote:
> Patrick,
> 
> > I'm afraid they look a lot like hardware errors to me. It might just be
> that it
> > doesn't like MULTI_MODE though. I'm not an IDE expert.
> 
> I turned MULTI_MODE on at a suggestion aimed to fix these very problems...
> they certainly are hardware errors but as we know anecdotally from other
> postings, the hardware can be perfectly ok and the errors still persist.  as
> my drive is brand new and I had no such errors before installing a PV on it,
> it seems reasonable to think it's not the drive.
> 
> is my data at risk of corruption?  I've slowly been checking the integrity
> of files but I'm concerned about backing up bad data!

Just because the drive is new doesn't mean it's not bust(!). 

I would do as someone suggested and run badblocks on the disk and if it gives
errors then take it back. If not then it may be related to some reports we saw
a while ago about LVM reading past the end of a SCSI disk - you can easily
verify this by making a filesystem on the PV rather that using LVM (If you're
happy with your backups that is...).

patrick
