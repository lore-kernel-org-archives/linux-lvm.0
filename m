Message-ID: <3FF05BB2.4070709@hasw.net>
From: Sebastian Witt <se.witt@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Endless loop running vgscan
References: <3FE4DE2E.2030705@hasw.net> <20031221233848.M21022@uk.sistina.com> <3FE7483D.90107@hasw.net> <20031229144051.P21022@uk.sistina.com>
In-Reply-To: <20031229144051.P21022@uk.sistina.com>
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
Date: Mon Dec 29 10:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Alasdair G Kergon wrote:

>>I've also this problem if I use this filter:
>>filter = [ "a/hd[e-h]1$/", "r/.*/" ]
> 
> Is that the wrong way round?  Accept the md devices instead of the
> hd ones if your mds are formed from hds.
> 

I have no md's. My LVM VG consists of four PVs, hd[e-h]1.

Sebastian
