From: Marek Jan <xjan@informatics.muni.cz>
Message-ID: <Pine.SGI.4.58.0401201520090.37355369@aisa.fi.muni.cz>
MIME-Version: 1.0
Subject: [linux-lvm] Initialize disk on /dev/nda
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
Date: Tue Jan 20 09:25:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

When I want create /dev/nda/0 device, what I need?
Is it possible without any sort of devfs ?
Marek Jan

> try /dev/nda/0
>
> same with loopback, cant create on /dev/loopX but can create on
> /dev/loop/X
