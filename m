Date: Fri, 27 Oct 2000 15:30:07 +0200
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Size limits and kernel versions
Message-ID: <20001027153007.A712@guldukat.muon>
References: <OLEAJMNOEMOMMNEIMMINEEEBCBAA.pswartz@digitalrom.com>
Mime-Version: 1.0
In-Reply-To: <OLEAJMNOEMOMMNEIMMINEEEBCBAA.pswartz@digitalrom.com>; from pswartz@digitalrom.com on Thu, Oct 26, 2000 at 02:04:39PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, 26.10.00, Patrick Swartz <pswartz@digitalrom.com> wrote:
> 
> Will I loose the data that is on both? just one?
> 

I'd say you have to wipe one array, create a physical volume and add it
to a volume group. Then you might want to create logical volumes and
copy your data from the other array to these LV's, wipe the second array
and add it to your volume group.

good luck,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
