Subject: Re: [linux-lvm] ERROR "pv_read(): PV identifier invalid" reading
	physical volumes
From: Matthew Kennedy <mkennedy@opushealthcare.com>
In-Reply-To: <1010527606.19493.46.camel@localhost.localdomain>
References: <1010527606.19493.46.camel@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Message-Id: <1010529428.19493.48.camel@localhost.localdomain>
Mime-Version: 1.0
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
Date: Tue Jan  8 16:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Never mind. A little more perseverance and I learned that it was my IDE
cdrw drive. I needed to add "append="ide-scsi"" to the relevant
/etc/lilo.conf stanza and then add ide-scsi to /etc/modules so that it
loads at boot.

Shouldn't LVM check against such devices being present and then skip
over them though?

Matt

On Tue, 2002-01-08 at 16:06, Matthew Kennedy wrote:
> Hello,
> 
> I'm having some trouble getting LVM to work on a Debian system. The
> actions I performed are bellow (--verbose --debug versions are
> attached). Bascically, I get "ERROR "pv_read(): PV identifier invalid"
> reading physical volumes" when I run vgcreate even though the PV I
> initialized succeeded.
> 
> My user tools are IOP10. Kernel is 2.4.17.
> 
> Thanks
> 
> Matt
> 
