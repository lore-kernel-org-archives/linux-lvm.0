Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OF94AD3C3B.E774A5C0-ON00256E0F.00529B9E-00256E0F.00529BAA@svunta.os.is>
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
Date: Fri Jan  2 09:12:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>note my patched initscripts does not care what the default alternative
>for lvm is (lvm1 or lvm2) but you might, so check and change it with the
>"update-alternatives --config" command if you have both rpm installed.

I noticed that lvm1 was loaded instead of lvm2 but when I check
update-alternatives --config lvm I see lvm2 used as default over lvm1.
Might this be causing my kernel panic (no init found).

-Kjartan
