Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] VG does not activate at boot
References: <3AECAFD9.6727396A@home.com>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 30 Apr 2001 02:48:46 +0200
In-Reply-To: Tom Otake's message of "Sun, 29 Apr 2001 19:20:41 -0500"
Message-ID: <wxxn18zjjpt.fsf@thrir.ifi.uio.no>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Tom Otake <totake66@home.com> writes:

> I 'm having a slight problem/inconvenience with LVM and need some
> assistance. Everytime I boot the system, the VG's do not come up
> active and subsequently, some fs don't mount. The error I get
> indicates the underlying device for the fs is not a valid device.
> 'vgdisplay' says the the VG is not active, which running 'vgdisplay
> -D' confirms. Running 'vgchange -a y swvg' resolves the problem,
> activates the VG and I can mount the fs. 

  you should add the vgchange command into your initscripts. I'm
  running RedHat and I added this into rc.sysinit, right below the
  init of raid devices:

,----
| action "LVM: Scanning for Volume Groups" vgscan
| action "LVM: Activating Volume groups" vgchange -ay
`----

  I probably should just tell you to RTFM a little as well:

  <url: http://www.sistina.com/lvm/doc/lvm_howto/node8.html
  #SECTION00084000000000000000 >

-- 
Terje
