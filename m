From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvcreate segfalts 2.4.16 1.0.1-rc4
Message-ID: <20011207095145.GC2067@tykepenguin.com>
References: <3C10846D.1050104@military-inc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C10846D.1050104@military-inc.com>
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
Date: Fri Dec  7 03:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 07, 2001 at 12:57:17AM -0800, Jesse Nelson wrote:
> Stock 2.4.16  and 1.0.1-rc4 LVM runing on RedHat 7.2 ( egcs 2.96

It's a Redhat compiler problem. You need to compile with -O0 or download 1.0.1

patrick
