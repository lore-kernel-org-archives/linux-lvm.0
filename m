From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM2 compatible with LVM1?
Message-ID: <20020717070718.GC11802@tykepenguin.com>
References: <200207170700.26815.marek@bmlv.gv.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200207170700.26815.marek@bmlv.gv.at>
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
Date: Wed Jul 17 02:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 17, 2002 at 07:00:26AM +0200, Ph. Marek wrote:
> Hello everybody,
> 
> I've got a question I couldn't find an answer yet.
> Is LVM2 compatible with LVM1? That is, are the on-disk-storage and the 
> command-line-parameters the same, do they present themselfes via devfs in the 
> same manner? (The last point I take as given, as it's only a logical sight 
> via my given names)
> 
> If it's possible I'd like to change the kernel, substitute the userspace-tools 
> (at startup, depending on whether LVM1 or LVM2 is used currently) and reboot 
> AND use the existing data.
> 
> Is that possible?

Yes, I do this all the time. In fact most of my kernels have both LVM1 and
device-mapper in them and I switch between the two without rebooting - remember
to vgchange -an first though !

If you do find any incompatibilites then please let us know.

patrick
