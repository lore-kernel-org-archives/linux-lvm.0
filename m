Date: Thu, 23 Aug 2001 01:40:12 -0700
From: David Rees <dbr@greenhydrant.com>
Message-ID: <20010823014012.A32700@greenhydrant.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM, rawio, ext2?
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

Hi,

I'd like to create an ext2 filesystem over a raw io device, is this even
possible?  (If not, skip the rest of this message! ;-)

I've searched various archives, and it seems that people are using lvm along
with rawio (and md!) with success, the question I have is "how do I do it?".

Which way is it best to layer the different io management schemes?  For
example, is it possible to put a md or lvm device on top of 1 or more raw io
devices and keep the data from being buffered?  If not, how do I create an
ext2 filesystem on a raw device?  Forcing it didn't work.

Thanks,
Dave
