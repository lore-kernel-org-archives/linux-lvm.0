Subject: Re: [linux-lvm] mount reiserfs snapshot failed
From: Chris Mason <mason@suse.com>
In-Reply-To: <3CBEB032.F1A6123A@mc-lindinger.de>
References: <3CBE92EB.89FB2B07@mc-lindinger.de>
    <20020418094402.GA1233@fib011235813.fsnet.co.uk>
    <3CBEB032.F1A6123A@mc-lindinger.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1019131514.669.37.camel@tiny>
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
Date: Thu Apr 18 07:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2002-04-18 at 07:38, Markus Bartl wrote:

> I rebuilt the kernel with lvm 1.0.3 and used the 1.0.3 tools. The
> problem is still there.

Could you please send the script?

During snapshot testing, I run two loops in the background:

while(1) 
mount /dev/vg/lv1 /foo
touch /foo/foo
rm /foo/foo
umount /foo/foo
end

while(1)
create snapshot
mount snapshot
umount snapshot
remove snapshot
end

-chris
