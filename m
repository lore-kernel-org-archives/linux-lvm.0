From: Marc MERLIN <marc_lvm@merlins.org>
Message-Id: <20020125233533.GK26045@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgchange -a y /dev/System fails
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
Date: Fri Jan 25 17:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

It fails and says:
parameter error setting up snapshot copy on write exception

So yes, I have  snapshots in there, but I can't delete  the snapshots if the
volume isn't active, and I can't activate the volume because of a snapshot.

To make things worse, /dev/System contains /usr and /var.

The snapshots were created with 1.0.1rc4 on 2.4.14 and I now run 2.4.17 with
1.0.1rc4-ish

What's the magic override I need to use to make the volume active again?

Thanks
Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
