From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] lvscan and df result differs
In-Reply-To: <1035818392.32410.328.camel@tinia>
Message-ID: <Pine.LNX.4.44.0210281530250.1691-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Mon Oct 28 09:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Also don't forget lvm first takes off a little bit of your disk for
its own use then it rounds the disk to your extent size, one of
your extents is also reserved for future lvm use, so if you use an extent
size of 4 meg 4.3-8.29 (approx) could be "missing" from your disk.

James
