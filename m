From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] recreate metadata of an PV possible if vda-backup present?
Message-ID: <20040122140727.GA992@tykepenguin.com>
References: <108049294.20040121235827@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <108049294.20040121235827@gmx.de>
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
Date: Thu Jan 22 09:10:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 21, 2004 at 11:58:27PM +0100, Malte Woelky wrote:
> Hallo,
> 
> 
> I had an VG called 'vg01' which contained the only PV  /dev/hdc
> 
> My problem happened during a system upgrade, where I could have
> removed the VG from the system or something else happened...
> 
> I do have an VDA backup /root/lvmconf/vg01.conf (attatched to this
> mail)
> 
> Is ist possible to recrate or restore the PV metadata? I believe that
> the data stored on this PV may be still there ...I hope so.
> 
> I searched the last two months for an sollution, but found nothing
> using google, diverse mailing list archives, heise-forum, etc ...
> 
> does someone on this list have any tip?
> 
> I would be very, very happy if someone could post some hints to try...
> 

# pvcreate /dev/hdc
# vgcfgrestore -n vg01 /dev/hdc
# vgscan

should restore the VG for you.


-- 

patrick
