From: James Manning <jmm@sublogic.com>
Message-ID: <20020626155454.A3538@xanex.hippierage.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [RFE] lvm-1.0.3 - progress bar similar to e2fsck for pvmove
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
Date: Wed Jun 26 14:55:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

just did a "pvmove /dev/hda5" and got tons and tons of info dumped to
the screen as extents were moved.  IMHO, that'd be nice for a verbose
mode, but by default it'd be nice to have something basically like
the e2fsck/wget/etc progress bar.  As it stands, I had no idea what %
of the way through the job I was and couldn't estimate finishing time,
both of which would be nice to have.

Adding to other long-running data-migration things may be a good idea as
well, but pvmove is the one I've come across that could really use it :)

Thanks!

James
-- 
James Manning <http://www.sublogic.com/james/>
GPG Key fingerprint = B913 2FBD 14A9 CE18 B2B7  9C8E A0BF B026 EEBB F6E4
