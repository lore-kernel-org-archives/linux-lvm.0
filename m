Message-ID: <C65F89D1AC0BB54B865127151A24DA780BAD64C4@nbexchm2.aliant.icn>
From: "Shaw, Marco" <Marco.Shaw@aliant.ca>
Subject: RE: [linux-lvm] Recovering from a disaster...
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
Date: Fri Nov 29 09:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

>> A typical scnerario could be LVM sitting on top of MD, and have to 
>> recover from some kind of disaster.  I wonder if the RedHat 8.0 rescue 
>> option has all the modules/tools to repair such a disaster.

> They don't support LVM out of the box, so this is unlikely.

Actually, RH now supports LVM as of 8.0.  An lsmod when in 'rescue mode' also shows lvm_mod.

The whole disaster with software RAID and LVM mixed in, isn't easy, but a friend and I figured it out yesterday.  Not knowing the system has a mix of both before troubleshooting could be (actually is) disastrous!

Marco
