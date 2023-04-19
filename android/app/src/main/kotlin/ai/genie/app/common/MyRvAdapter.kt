package ai.genie.app.common

import android.annotation.SuppressLint
import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import ai.genie.app.R
import ai.genie.app.common.extension.getProperTextColor


internal class MyRvAdapter(var data: List<String>, var mContext: Context) :
    RecyclerView.Adapter<MyRvAdapter.MyHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyHolder {
        val view: View =
            LayoutInflater.from(mContext).inflate(R.layout.rv_suggestions_item, parent, false)
        return MyHolder(view)
    }

    open fun setItems(dataList: List<String>) {
        this.data = dataList
        notifyDataSetChanged()
    }

    open fun removeItems() {
        this.data = listOf()
        notifyDataSetChanged()
    }

    override fun onBindViewHolder(holder: MyHolder, position: Int) {
        holder.tvTitle.text = data[position]
        holder.tvTitle.setTextColor(mContext.getProperTextColor())
        if (position == 2) {
            holder.line.visibility = View.GONE
        } else {
            holder.line.visibility = View.VISIBLE
        }
    }

    override fun getItemCount(): Int {
        return data.size
    }

    internal inner class MyHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var tvTitle: TextView
        val line: View

        init {
            tvTitle = itemView.findViewById(R.id.tvSuggestion)
            line = itemView.findViewById(R.id.view1) as View
        }
    }
}