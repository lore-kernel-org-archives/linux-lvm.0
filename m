From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] combining two vg's into one
Message-ID: <20040129105713.GA12894@tykepenguin.com>
References: <20040129022341.88184.qmail@web80402.mail.yahoo.com> <200401290444.i0T4iVX02132@ecstasy.winternet.com> <87ektj8dxm.fsf@swbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ektj8dxm.fsf@swbell.net>
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
Date: Thu Jan 29 06:15:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 29, 2004 at 12:30:13AM -0600, Christopher Mark Conn wrote:
> Ken Fuchs <kfuchs@winternet.com> writes:
> 
> 
> Thanks Ken, that's one thing I was wondering, is it 
> better to keep one vg per pv. Sounds like I'm already
> set up the way I need to be.
> 

I don't think so. One of the major points of LVM is that volumes can span
physical disks and you can transparently add disks to the systems and grow
existing LVs over them.

To merge two Volume Groups, try the "vgmerge" command. The only prerequisite is
that they have the same PE size (which is set at vgcreate time).

-- 

patrick
