From: Markus Schaub <markus.schaub@gmx.net>
Message-Id: <20020227131803.A188@sparcie.schaub.loc>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] "invalid i/o-protocol version" with e2fsadm (1.0.3) and 2.4.18
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
Date: Wed Feb 27 06:18:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I always get an "i/o protocol version" error when trying to resize a
lv witch e2fsadm (statically linked, from lvm-1.0.3 with kernel
2.4.18).
Some time ago I got the same error with e2fsadm 1.0.1-rc4 on
2.4.13-ac7. In this case e2fsadm resized the filesystem but could not
resize the lv. Resizing the lv with lvreduce (same version) worked.

I think with 1.0.3 it is the same, but I could not test is as I don't
have a system to play around.
So how can I get e2fsadm to work?

Markus
