Message-ID: <3BBCA384.EC6D4D53@ti.com>
Date: Thu, 04 Oct 2001 19:59:32 +0200
From: christian e <cej@ti.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm 1.0 and kernel 2.2.19.Is rawio patch necessary ??
References: <3BBC550E.442F190C@ti.com> <3BBC7C22.1119BF0@promofinarsa.es> <3BBC90C9.309A3D75@ti.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

christian e wrote:


> I think I'll try the 2.2.18 patch as well..Will let you all know if it
> turned out ok or not..


Just tried the following:

removed old kernel source tree,untarred a fresh 2.2.19 source.Did a
./configure in the lvm source dir.Then a make in the PATCHES DIR.Then
applied the rawio patch for 2.2.18 and then the lvm-1.0 patch for my
kernel 2.2.19.Patched clean without problems.

Then compiled the kernel again.Then the modules..mind you I compiled lvm
into the kernel not as module..No problems.

Bootup withput problems (only forgetting to patch with aacraid driver
but htat's another story :-)

compiled lvm and installed..Works ok..

best regards

Christian
