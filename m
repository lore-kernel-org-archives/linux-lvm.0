From: Spam <spam@tnonline.net>
Message-ID: <828946327.20031209150601@tnonline.net>
Subject: Re: [linux-lvm] lvm and windows shares
In-Reply-To: <67110306296.20031209155309@fan.lt>
References: <67110306296.20031209155309@fan.lt>
MIME-Version: 1.0
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
Date: Tue Dec  9 08:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Aras <linux-lvm@sistina.com>


> Hi,

>    Can I create LV from windows shares?
>    EGZ. I have 5 windows shares of 30 GB, so I need one directory that
>    would be 150GB size

     Sounds  rather  "different"  to do. But yes, you can create files
     and  use  those  to  run LVM in. But given the stability of SMB I
     would  not.  It  is better if you can do it with NFS or move some
     disks around.

>    Just tell me if it posible to to.

>    Thanks.
