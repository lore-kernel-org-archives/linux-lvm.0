From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Problems with ext3 on LVM
Message-ID: <20040109192812.GA2638@muon.de>
References: <20040109112801.58250.qmail@web12301.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040109112801.58250.qmail@web12301.mail.yahoo.com>
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
Date: Fri Jan  9 14:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 09.01.04, Cody Bailey <codyb81@yahoo.com> wrote:

> What gives? Shouldn't all drives show up with partition types of LinuxLVM if they are in a LVM setup? Why did they change?
>  
> (Sorry this is kinda confusing, i'm not in my best writing state...18 hours awake and still got lots of oragnizing to do)

If your partition tables are gone, it may be possible (esp. when sleepy)
that you mistakenly used pvcreate on the device (e.g. /dev/hde) instead of
on the partition (/dev/hde1). Happend to me, once :)

Nils

-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).
