From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] My LVM does not work at all.
Message-ID: <20020613065907.GC1038@tykepenguin.com>
References: <20020613002104.A18315@verso.st.jyu.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020613002104.A18315@verso.st.jyu.fi>
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
Date: Thu Jun 13 01:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 13, 2002 at 12:21:05AM +0300, Juhapekka Tolvanen wrote:
> 
> LVM does not work at all. I have tried LVM as a modules and as compiled in
> driver. All in vain. I started last sunday or monday with 2.4.19-pre10 with and
> without Alan Cox patch number 2 and with and without preemptible patch by Robert
> Love. Now, few days later I am totally frustrated and mad.
> 
> My latest attempts was this:
> 
> - Kernel 2.4.18
> - Patches from LVM sources version 1.0.4

Check that /dev/lvm has the right major/minor numbers: "ls -l /dev/lvm" 
should give you something like this:

# ls -l /dev/lvm
crw-r-----    1 root     root     109,   0 Mar 13  2001 /dev/lvm


patrick
