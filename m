Message-ID: <3EE857C8.2050300@maintech.de>
From: Thomas Kleffel <thomas.kleffel@maintech.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to grow a PV?
References: <3EE83C19.10805@maintech.de> <20030612121012.C26918@sistina.com>
In-Reply-To: <20030612121012.C26918@sistina.com>
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
Date: Thu Jun 12 05:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi!

Heinz J . Mauelshagen wrote:

>Sounds like you added a new disk to the end of a linear MD ?
>
>You could have pvcreate'd it directly to add it to a Volume Group
>(not adding it to the MD at all).
>  
>
Not exactly - I added a new disk to a raid-5 MD. I wanted it to be in 
the raid-array for beeing protected from a single-disk-failure.

>LVM2 supports PV resizing.
>
Ok, thanks - I'm going to try this now...

Bye,

Thomas
