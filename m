From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] determing lvm support
Message-ID: <20031221080801.GJ24434@percy.comedia.it>
References: <1071881237.1464.14.camel@rich> <20031220123023.H21022@uk.sistina.com> <20031220133541.GF24434@percy.comedia.it> <20031220233051.I21022@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031220233051.I21022@uk.sistina.com>
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
Date: Sun Dec 21 02:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Dec 20, 2003 at 11:30:51PM +0000, Alasdair G Kergon wrote:
>On Sat, Dec 20, 2003 at 02:35:41PM +0100, Luca Berra wrote:
>> Besides that is there any way to reliably check if dm is loaded from a
>> c program, besides calling dm_task_run(), which is noisy if the driver
>> is not loaded? I don't want the user to see an error if she's not
>> running device-mapper.
>
>Look at using dm_log_init() to provide a function that
>suppresses all output.
I'll look at it, but it seems i cannot restore the previous log function
then, i think it's easier to bypass the lib for my particular case.
Thanks a lot for your answers.

Regards,
L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
