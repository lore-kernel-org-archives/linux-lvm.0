content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Kernel 2.4.12 bug?
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FF82@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
Date: Wed Oct 24 02:19:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Also at reboot/halt I get:
>  printing eip:
> c014c022
> Oops: 0000
> CPU:    0
> EIP:    0010:[proc_match+18/56]    Tainted: P
> EFLAGS: 00010206
> eax: d9fc2609   ebx: 03   ecx: 03   edx: 5a5a5a5a
> esi: d9fc2609   edi: d9fc260d   ebp: d65f7d18   esp: d65f7d10
> ds: 0018   es: 0018   ss: 0018
> Process vgchange (pid: 345, stackpage=3Dd65f7000)
> etc...

I also have problems with 2.4.12 + LVM rc4. I have a kernel panic with a
"stack trace" in the kernel *before* it mounts ROOT.
Any idea? Everything works fine with 2.4.7 / 2.4.9

-jec
