From: Kevin Corry <kevincorry@sbcglobal.net>
Subject: Re: [linux-lvm] ioctl interface mismatch
References: <20030626201310.GA1042@gmx.de>
In-Reply-To: <20030626201310.GA1042@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200306270849.22072.kevincorry@sbcglobal.net>
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
Date: Fri Jun 27 08:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Wiktor Wodecki <wodecki@gmx.de>

On Thursday 26 June 2003 15:13, Wiktor Wodecki wrote:
> Hello,
>
> I am running 2.5.72 and use device-mapper to manage two vg's with
> several lv's. However at boot-time I see the following message:
>
> device-mapper: ioctl interface mismatch: kernel(1.0.6), user(3.0.0),
> cmd(0)
>
> 1.0.6 could be an lvm release, however, I have lvm2 metadata and not
> lvm1. My system runs debian testing with the lvm2 utilities installed
> (1.95.15-1). I run x86.
>
> Any help would be appreciated.

The EVMS tools use version 3.0.0 of the Device-Mapper ioctl interface. Are you 
boot-scripts running evms_activate?

-Kevin Corry
