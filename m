From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] actual vg size
Message-ID: <20030811124214.GB3234@tykepenguin.com>
References: <200308071036.h77AaSpu016477@ns1.globcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308071036.h77AaSpu016477@ns1.globcom.net>
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
Date: Mon Aug 11 07:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 07, 2003 at 01:36:28PM +0300, Mkn wrote:
>    hi
>    i intend to work with lvm10 (debian package) but one thing stops me.
>    when i create a vg i get INFO:: maximum size is 255GB
>    all my hdds exceed this. Does the next version of lvm have big vg size or
>    i have to make 5 vg out of 7 disks ?
>    thanks in advance

That sounds like quite an old version of the package, the default PE size was
increased some time ago.

You can override this with "vgcreate -s 32M" which will allow up to 2TB in a VG.
-- 

patrick
