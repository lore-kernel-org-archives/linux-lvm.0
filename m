Message-ID: <3E8BD9F6.21581C8A@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help for Vg max size
References: <025001c2f79b$7aedc6b0$64451c0a@dokho>
Content-Transfer-Encoding: 7bit
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
Date: Thu Apr  3 00:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

When you create your VG, you choose a PE size. I think there is a max of
65k PE's for
a disk. See man vgcreate, or the LWN howto.

google for: lvm howto linux + i'm feeling lucky



JonB
