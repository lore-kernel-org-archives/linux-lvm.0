From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Paralell IO performance with LVM and XFS
Message-Id: <20020117172041.GI1066@tykepenguin.com>
References: <20020117164304.GH1066@tykepenguin.com>
    <1011287191.26064.0.camel@UberGeek>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1011287191.26064.0.camel@UberGeek>
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
Date: Thu Jan 17 11:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 17, 2002 at 11:06:31AM -0600, Austin Gonyou wrote:
> Hmm..it seems like writing with LVM striping isn't very good. 
> 10MB/s or so. Is this IDE only, or SCSI too?

It's the random stuff that's suffering. Sequential Input seems to
scale as far as the fibre-channel interface would allow at about 5M/s, and the
writes start to flatten out after two stripes.

The interface was an emulex Fibre-channel but the disks are quote slow ones.
Effectively it's SCSI.

patrick
