Message-ID: <4C405C33.1080306@redhat.com>
Date: Fri, 16 Jul 2010 15:18:43 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <01b301cb23a5$7386ef30$5a94cd90$@com>
In-Reply-To: <01b301cb23a5$7386ef30$5a94cd90$@com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Command line problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Emilio Arias <earias@idecnet.com>

On 07/15/2010 12:39 AM, Emilio Arias wrote:
> I got this message on my Ubuntu Server 10.04. �Is this the place for reporting? �Where should I report it?

This is fixed already upstream (lvm2 >= 2.02.55), (both leaks and also using %PVS without arguments).

So report it to Ubuntu to upgrade lvm2 packages.

Milan
