From: Sander <boeraa@wanadoo.nl>
Message-ID: <3676921183.20020613204913@wanadoo.nl>
Subject: Re: [linux-lvm] Can't find LVM partition
In-Reply-To: <C394073E4521D411ABF10006293838D604CA574F@cmh0401mai01.amr.stercomm.com>
References: 
 <C394073E4521D411ABF10006293838D604CA574F@cmh0401mai01.amr.stercomm.com>
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
Date: Thu Jun 13 13:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

(Response to message from Stauffer, Darryl, Darryl_Stauffer@stercomm.com on Thursday, June 13, 2002 5:36:38 PM)

Hallo Darryl,

I've not used LVM for a long time, but if you have backups of the
meta data it should be possible using vgcfgrestore.

-- 

Regards,
Sander

Thursday, June 13, 2002, 5:36:38 PM, you wrote:

> Hello,

> I just got done upgrading from Redhat 7.2 to Redhat 7.3.  My home directory
> was setup on its own partition using LVM and reiserFS.  The upgrade was done
> by formatting the original root partition and reinstalling OS which means
> that all the LVM info is gone.  Is there any way to recover my LVM
> partition?

> Thanks,
> Darryl

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
