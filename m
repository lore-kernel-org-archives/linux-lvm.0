From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Date: Wed, 10 Oct 2001 07:48:31 -0400
Message-ID: <000001c15181$7c3b32d0$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Downgrading
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
To: linux-lvm@sistina.com

As I have recently discovered, there isn't yet an official patch for
EXT3 on 2.4.10.  If that is the case, I suppose I should downgrade in
order to achieve stability.  Right now, I'm running 2.4.10
kernel/1.0.1rc4 LVM tools and kernel patch.  Can anyone recommend a good
kernel rev that properly (and officially, if there is such a thing yet)
supports EXT3 and LVM.  Also, I need to be sure that the LVMs I have
currently built under 2.4.10 kernel /1.0.1rc4 tools and kernel patch
will still work on whatever downgrades I do.  Finally, I want to find
some version of LVM that doesn't force me to make all these crazy
changes in order to migrate to newer versions later on in the future.

Can anyone make any suggestions?

Thanx!
